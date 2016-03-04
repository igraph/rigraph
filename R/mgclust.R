#' Graph Clustering Using SVT and NMF -- Clusters Implied by Singular Value Thresholding
#' 
#' Performs Clustering of Graphs using Singular Value Thresholding and Non-negative Factorization.
#' 
#' @concept Graph Clustering
#' @aliases gclust.rsvt
#' 
#' @param glist List of \code{igraph} Objects
#' @param r Maximum Number of Clusters Allowed
#' @param maxsvt Maximum Number of Singular Value Thresholding; Default is 10
#' @param nmfout T/F indicating if the output from nmf should be returned; Default is FALSE
#' @param maxit A number passed to irlba or svd function limiting the number of iteration; Default is 10000
#' @param nmfmethod A number passed to irlba or svd, limiting the number of iterations; Default is 'lee'
#' 
#' @return \code{nmf} An NMF object
#' @return \code{W} Basis Graphs
#' @return \code{H} Probability Vector for Cluster Weights timeseries of graphs
#' @return \code{Xorigin} Input Data in the matrix form
#'
#' @author Nam Lee \email{nhlee@jhu.edu}
#' @export

gclust.rsvt <- function(glist,r=1,maxsvt=10,nmfout=FALSE,maxit=10000,nmfmethod='lee') 
{

    if (! requireNamespace("NMF", quietly = TRUE)) {
      stop("This function requires the 'NMF' package")
    }

    # rsvt -- repeated singular value thresholding 
    # input could be a list of graphs (igraph model) 
    # or a matrix, where each column corresponds to 
    # a vectorized version of a graph 

	if (is.list(glist)) {
	    Time <- length(glist)
	    if (class(glist[[1]])=="igraph") {
	        glist <- lapply(glist,get.adjacency)
	    }
	    Xorigin <- sapply(glist,as.vector)
	} else {
	    Xorigin = glist
	}
	
	Xraw = Xorigin 
	Xorigin = Xorigin %*% solve(diag(colSums(Xorigin)))

	mysvd = tryCatch(irlba::irlba(Xorigin,r,r,maxit=maxit), error=function(e) svd(Xorigin,r,r))
	U = mysvd$u[,1:r,drop=FALSE]
	V = mysvd$v[,1:r,drop=FALSE]
	if(r == 1) {
	    S = matrix(mysvd$d[1:r],1,1)
	} else {
	    S = diag(mysvd$d[1:r])
	}
	
	maxsvt = ifelse(maxsvt > 0,maxsvt, 1)
	for(itr in 1:maxsvt) {
	    X = U %*% S %*% t(V)
	    X[X<0]=0
	    mysvd = tryCatch(irlba::irlba(X,r,r,maxit=maxit), error=function(e) svd(X,r,r))
	    UU = mysvd$u[,1:r,drop=FALSE]
	    VV = mysvd$v[,1:r,drop=FALSE]
	    if(r == 1) {
	        SS = matrix(mysvd$d[1:r],1,1)
	    } else {
	        SS = diag(mysvd$d[1:r])
	    }
	    if(norm(UU-U) + norm(VV-V) + norm(SS-S) < 1e-12) {
	        break
	    }
	    U = UU;
	    V = VV;
	    S = SS;
	}
	
	XX = X %*% solve(diag(colSums(X)))
	stash = which(rowSums(XX)==0)
	if(length(stash)>0){
	    XX =  XX[-stash,]
	}

	mynmf = NMF::nmf(XX,rank=r,method=nmfmethod)
	WW = matrix(0,nrow=nrow(X),ncol=r)
	if(length(stash)>0){
	    WW[-stash,] = NMF::basis(mynmf)
	} else {
	    WW = NMF::basis(mynmf)
	}
	
	HH = coef(mynmf)
	if(r > 1) {
	    HH = diag(colSums(WW)) %*% HH
	    WW = round(WW %*% solve(diag(colSums(WW))),12)
	    HH = round(HH %*% solve(diag(colSums(HH))),12)   
	} else {
	    HH = colSums(WW) %*% HH
	    WW = round(WW/colSums(WW),12)
	    HH = round(HH %*% solve(diag(colSums(HH))),12)   
	}
	
	if(nmfout)
	    return(list(nmf=mynmf, W=WW, H=HH, Xorigin=Xraw))
	else 
	    return(list(nmf=NULL,  W=WW, H=HH, Xorigin=Xraw))
}



#' Graph Clustering Using NMF (and no SVT) -- Apparent Clusters
#'
#' Performs Clustering of Graphs using Non-negative Factorization.
#' 
#' @concept Graph Clustering
#' 
#' @param glist List of \code{igraph} Objects
#' @param r Maximum Number of Clusters Allowed
#' @param nmfout T/F indicating if the output from nmf should be returned; Default is FALSE
#' @param maxit A number passed to irlba or svd function limiting the number of iteration; Default is 10000
#' @param nmfmethod A number passed to irlba or svd, limiting the number of iterations; Default is 'lee'
#' 
#' @return \code{nmf} An NMF object
#' @return \code{W} Basis Graphs
#' @return \code{H} Probability Vector for Cluster Weights timeseries of graphs
#' @return \code{Xorigin} Input Data in the matrix form
#' 
#' @author Nam Lee \email{nhlee@jhu.edu}
#' 
#' @export
#' @importFrom stats coef

gclust.app <- function(glist, r=1, nmfout=FALSE, maxit=10000, nmfmethod='lee') 
{
    if (! requireNamespace("NMF", quietly = TRUE)) {
      stop("This function requires the 'NMF' package")
    }

    # app -- apparent (clustering), i.e. no rsvt
    # input could be a list of graphs (igraph model) 
    # or a matrix, where each column corresponds to 
    # a vectorized version of a graph 

	if (is.list(glist)) {
	    Time <- length(glist)
	    if (class(glist[[1]])=="igraph") {
	        glist <- lapply(glist,get.adjacency)
	    }
	    Xorigin <- sapply(glist,as.vector)
	} else {
	    Xorigin = glist
	}
	
	Xraw = Xorigin 
	XX = Xorigin %*% solve(diag(colSums(Xorigin)))
	
	stash = which(rowSums(XX)==0)
	if(length(stash)>0){
	    XX =  XX[-stash,]
	}

	mynmf = NMF::nmf(XX,rank=r,method=nmfmethod)
	WW = matrix(0,nrow=nrow(Xraw),ncol=r)
	if(length(stash)>0){
	    WW[-stash,] = cbind(NMF::basis(mynmf))
	} else {
	    WW = NMF::basis(mynmf)
	}
	HH = coef(mynmf)
	if(r > 1) {
	    HH = diag(colSums(WW)) %*% HH
	    WW = round(WW %*% solve(diag(colSums(WW))),12)
	    HH = round(HH %*% solve(diag(colSums(HH))),12)   
	} else {
	    HH = colSums(WW) %*% HH
	    WW = round(WW /colSums(WW),12)
	    HH = round(HH %*% solve(diag(colSums(HH))),12)   
	}
	
	if(nmfout)
	    return(list(nmf=mynmf,W=WW,H=HH, Xorigin=Xraw))
	else 
	    return(list(nmf=NULL,W=WW,H=HH, Xorigin=Xraw))
}



#' Compute AIC based on a Poisson Approximation using the output from \code{gclust}
#'
#'     Compute and Extract information Criteria Value from \code{gclust} using a Poisson
#'     approximation, where the penality term is adjusted for small sample cases.  
#'
#' @concept Compute Information Criteria Value Using a Poisson Approximation 
#' 
#' @param gfit The output from a call to \code{gclust.rsvt} or \code{gclust.app}
#'
#' @return \code{nclust} Number of clusters being considered
#' @return \code{negloglikpart} Negative log likelihood part
#' @return \code{parampart} Parameter penalty term
#' @return \code{AIC} AIC Value Using a Possion approximation
#' 
#' @author Nam Lee \email{nhlee@jhu.edu}
#' 
#' @aliases getAICc
#' @export

getAICc <- function(gfit) {

    # input is the output from a call to gclust.rsvt or gclust.app
    
	Xorigin = gfit$Xorigin
	Xmean = gfit$W %*% gfit$H %*% diag(colSums(Xorigin))
	Xmean[Xmean<1e-12] = 0
	
	Phat = gfit$W %*% gfit$H
	Phat[Phat < 1e-12] = 0
	if(ncol(gfit$W) > 1) { 
	    nparams = colSums((1.0*(gfit$W > 0) ))
	    nparams = nparams %*% diag(1/colSums(Xorigin %*% t(gfit$H)))
	    nparams = sum(nparams)
	} else {
	    nparams = colSums((1.0*(gfit$W > 0) ))
	    nparams = nparams/colSums(Xorigin %*% t(gfit$H))
	    nparams = sum(nparams)
	}
	
	zeroprob = which(Phat<1e-12)
	if(any(Xorigin[zeroprob]> 1e-12)) {
	    retval = Inf
	} else {
	    if(length(zeroprob) > 0) {
	        Phat = Phat[-zeroprob]
	    } 
	    retval = 2*(nparams) - 2*sum(Phat*log(Phat))
	}
	
	data.frame(nclust=ncol(gfit$W),  negloglikpart=-2*sum(Phat*log(Phat)),  parampart=2*nparams, AIC=retval) 
}
