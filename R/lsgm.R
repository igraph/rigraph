
spectralEmbed <- function(A, B, numdim) {

  sa <- svd(A, nu = numdim)
  XA <- sa$u %*% diag(sa$d[1:numdim])
  sb <- svd(B, nu = numdim)
  XB <- sb$u %*% diag(sb$d[1:numdim])
  list(XA = XA, XB = XB)
}

kmeansAlg <- function(x, centers) {
  res <- kmeans(x, centers)
  Dis <- matrix(0, nrow(x), nrow(res$centers))
  for (c in 1:nrow(res$centers)) {
    Dis[, c] <- colSums((t(x) - res$centers[c,]) ^ 2)
  }
  list(res$cluster, res$centers, Dis)
}

seedgraphmatchell2 <- function(A, B, m) {
  res <- match_vertices(A, B, m, start = ones(nrow(A) - m), iteration = 25)
  c(seq_len(m), res$corr[,2])
}

## From MCMCpack

procrustes_orig <- function (X, Xstar, translation = FALSE,
                             dilation = FALSE) {
  if (nrow(X) != nrow(Xstar)) {
    cat("X and Xstar do not have same number of rows.\n")
    stop("Check data and call procrustes() again. \n")
  }
  if (ncol(X) != ncol(Xstar)) {
    cat("X and Xstar do not have same number of columns.\n")
    stop("Check data and call procrustes() again. \n")
  }
  n <- nrow(X)
  m <- ncol(X)
  if (translation) {
    J <- diag(n) - 1/n * matrix(1, n, n)
  } else {
    J <- diag(n)
  }
  C <- t(Xstar) %*% J %*% X
  svd.out <- svd(C)
  R <- svd.out$v %*% t(svd.out$u)
  s <- 1
  if (dilation) {
    mat1 <- t(Xstar) %*% J %*% X %*% R
    mat2 <- t(X) %*% J %*% X
    s.numer <- 0
    s.denom <- 0
    for (i in 1:m) {
      s.numer <- s.numer + mat1[i, i]
      s.denom <- s.denom + mat2[i, i]
    }
    s <- s.numer/s.denom
  }
  tt <- matrix(0, m, 1)
  if (translation) {
    tt <- 1/n * t(Xstar - s * X %*% R) %*% matrix(1, n, 1)
  }
  X.new <- s * X %*% R + matrix(tt, nrow(X), ncol(X), byrow = TRUE)
  return(list(X.new = X.new, R = R, tt = tt, s = s))
}

## This is the R equivalent of the Matlab function,
## at least as far as we need it

procrustes <- function(X, Y) {
  res <- procrustes_orig(Y, X, translation = TRUE, dilation = TRUE)
  sc <- sum(scale(X, scale = FALSE) ^2)
  list(
    d = sum((res$X.new - X) ^2) / sc,
    Z = res$X.new,
    tr = list(
      T = res$R,
      b = res$s,
      c = matrix(res$tt, nrow = nrow(X), ncol = length(res$tt), byrow = TRUE)
    )
  )
}

fill <- function(value, ...) {
  dim <- unlist(list(...))
  if (length(dim) == 1) dim <- c(dim, dim)
  array(value, dim = dim)
}

ones <- function(...) {
  fill(1, ...)
}

zeros <- function(...) {
  fill(0, ...)
}

#' @export

lsgm <- function(A, B, s, numdim, numclust, embedAlg = spectralEmbed,
                 clustAlg = kmeansAlg, graphMatchAlg = seedgraphmatchell2) {

  start <- proc.time()
  sumn <- max(dim(A)) - s;

  ## perform embedding
  startt <- proc.time()
  XA_XB <- embedAlg(A, B, numdim)
  XA <- XA_XB[[1]]
  XB <- XA_XB[[2]]
  message(sprintf("done projection: %f",
                  (proc.time() - startt)["elapsed"]))

  ## compute procrusties othogonal projection (on the seed vertices)
  startt <- proc.time()
  TRANSFORM <- procrustes(XA[1:s,], XB[1:s,])[[3]]
  TRANSFORM$c <- ones(sumn + s, 1) %*% TRANSFORM$c[1,]
  XB <- TRANSFORM$b * XB %*% TRANSFORM$T + TRANSFORM$c
  message(sprintf("done procrusties: %f",
                  (proc.time() - startt)["elapsed"]))

  ## cluster using the embedding
  startt <- proc.time()
  XAXB <- rbind(XA, XB)
  nonseedsA <- (s + 1) : (s + sumn)
  nonseedsB <- (s + sumn + s + 1) : (2 * (s + sumn))
  IDX_centroid_Dis <- clustAlg(XAXB, numclust);
  IDX <- IDX_centroid_Dis[[1]]
  centroid <- IDX_centroid_Dis[[2]]
  Dis <- IDX_centroid_Dis[[3]]
  message(sprintf("done clustering: %f",
                  (proc.time() - startt)["elapsed"]))

  ## Fixing cluster sizes to be equal in both graphs
  startt <- proc.time()
  IDXA = IDX[nonseedsA]
  DisA = Dis[nonseedsA,]
  IDXB = IDX[nonseedsB]
  DisB = Dis[nonseedsB,]

  clustsizesA <- zeros(numclust, 1);
  clustsizesB <- zeros(numclust, 1);
  for (i in 1:numclust) {
    iiAi <- which(IDXA == i)
    iiBi <- which(IDXB == i)
    clustsizesA[i] <- length(iiAi)
    clustsizesB[i] <- length(iiBi)
  }

  clustsizes <- round( (clustsizesA + clustsizesB) / 2 )

  ## add or subtract 1 from largest cluster sizes
  ind <- order(clustsizes, decreasing = TRUE)
  temp <- sumn - sum(clustsizes)
  mask <- ind[1:abs(temp)]
  clustsizes[mask] <- clustsizes[mask] + sign(temp)

  clust_labels <- zeros(s + sumn, 2, numclust)

  pieceA_ <- vector("list", numclust)
  pieceB_ <- vector("list", numclust)
  gA_ <- vector("list", numclust)
  gB_ <- vector("list", numclust)

  for (i in 1:numclust) {
    if (clustsizes[i] == 0) next
    TA <- order(DisA[,i])
    TB <- order(DisB[,i])
    gA <- TA[1:(clustsizes[i])]
    gB <- TB[1:(clustsizes[i])]
    ## make these vertices unselectable for next time
    DisA[gA,] <- Inf
    DisB[gB,] <- Inf

    gA <- gA + s
    gB <- gB + s

    ## sav cluster labels
    clust_labels[gA, 1, ] <- numclust
    clust_labels[gB, 2, ] <- numclust

    gAaug <- c(1:s, gA)
    gBaug <- c(1:s, gB)

    pieceA_[[i]] <- A[gAaug, gAaug]
    pieceB_[[i]] <- B[gBaug, gBaug]

    gA_[[i]] <- gA
    gB_[[i]] <- gB
  }

  ## perform graph matching in parallel (not really)
  match <- zeros(s + sumn, numclust)
  for (i in 1:numclust) {
    ## load subgraph adjacency matrix
    gA <- gA_[[i]]
    gB <- gB_[[i]]
    pieceA <- pieceA_[[i]]
    pieceB <- pieceB_[[i]]

    ## if graph is empty
    if (length(gA) == 0) next

    ## perform graph match
    ord <- graphMatchAlg(pieceA, pieceB, s)
    ord <- ord[(s + 1):length(ord)] - s

    ## save results
    temp <- zeros(s + sumn, 1)
    temp[gA] <- gB[ord]
    match[,i] <- temp
  }

  ## combine results
  match[1:s, 1] <- 1:s
  match <- rowSums(match)
  
  message(sprintf("done matching: %f",
                  (proc.time() - startt)["elapsed"]))
  message(sprintf("total time: %f",
                  (proc.time() - start)["elapsed"]))

  match
}
