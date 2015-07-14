
#   IGraph R package
#   Copyright (C) 2010-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#   
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

.igraph.pb <- NULL

#' @export

.igraph.progress <- function(percent, message, clean=FALSE) {
  if (clean) {
    if (!is.null(.igraph.pb)) { close(.igraph.pb) }
    return(invisible())
  }
  type <- igraph_opt("verbose")
  if (is.logical(type) && type) {
    .igraph.progress.txt(percent, message)
  } else {
    switch (type,
            "tk"=.igraph.progress.tk(percent, message),
            "tkconsole"=.igraph.progress.tkconsole(percent, message),
            stop("Cannot interpret 'verbose' option, this should not happen"))
  }
}

#' @export

.igraph.status <- function(message) {
  type <- igraph_opt("verbose")
  if (is.logical(type) && type) {
    message(message, appendLF=FALSE)
  } else {
    switch(type,
           "tk"=message(message, appendLF=FALSE),
           "tkconsole"=.igraph.progress.tkconsole.message(message, start=TRUE),
           stop("Cannot interpret 'verbose' option, this should not happen"))
  }
  0L
}

#' @importFrom utils txtProgressBar setTxtProgressBar

.igraph.progress.txt <- function(percent, message) {
  pb <- get(".igraph.pb", asNamespace("igraph"))
  if (percent==0) {
    if (!is.null(pb)) { close(pb) }
    cat(sep="", "  ", message, "\n")
    pb <- txtProgressBar(min=0, max=100, style=3)
  }
  setTxtProgressBar(pb, percent)
  if (percent==100) {
    close(pb);
    pb <- NULL
  }
  assign(".igraph.pb", pb, envir=asNamespace("igraph"))
  0L
}

.igraph.progress.tk <- function(percent, message) {
  pb <- get(".igraph.pb", asNamespace("igraph"))
  if (percent==0) {
    if (!is.null(pb)) { close(pb) }
    pb <- tcltk::tkProgressBar(min=0, max=100, title=message, label="0 %")
  }
  tcltk::setTkProgressBar(pb, percent, label=paste(percent, "%"))
  if (percent==100) {
    close(pb);
    pb <- NULL
  }
  assign(".igraph.pb", pb, envir=asNamespace("igraph"))
  0L
}

.igraph.progress.tkconsole <- function(percent, message) {
  pb <- get(".igraph.pb", asNamespace("igraph"))
  startmess <- FALSE

  ## Open the console, if it is not open
  if (is.null(pb)) {
    startmess <- TRUE
    pb <- .igraph.progress.tkconsole.create(NA)
  }

  ## Update progress bar
  pb$pb$set(pb$pb$widget, percent)
  tcltk::tkconfigure(pb$pb$label, text=substr(message, 1, 20))
  tcltk::tcl("update", "idletasks")
  
  ## Done
  assign(".igraph.pb", pb, envir=asNamespace("igraph"))  
  if (startmess) .igraph.progress.tkconsole.message("Console started.\n")
  0L
}

.igraph.progress.tkconsole.create <- function(oldverb) {
  console <- tcltk::tktoplevel()
  tcltk::tktitle(console) <- "igraph console"

  fn <- tcltk::tkfont.create(family="courier", size=8)

  lfr <- tcltk::tkframe(console)
  image <- tcltk::tkimage.create("photo", "img", format="gif",
                          file=system.file("igraph2.gif", package="igraph"))
  logo <- tcltk::tklabel(lfr, relief="flat", padx=10, pady=10, image=image)
  
  scr <- tcltk::tkscrollbar(console, repeatinterval=5,
                     command=function(...) tcltk::tkyview(txt, ...)) 
  txt <- tcltk::tktext(console, yscrollcommand=function(...) tcltk::tkset(scr, ...),
                width=60, height=7, font=fn)
  tcltk::tkconfigure(txt, state="disabled")
  pbar <- .igraph.progress.tkconsole.pbar(console)

  bclear <- tcltk::tkbutton(lfr, text="Clear", command=function() {
    tcltk::tkconfigure(txt, state="normal")
    tcltk::tkdelete(txt, "0.0", "end")
    tcltk::tkconfigure(txt, state="disabled")
  })
  bstop  <- tcltk::tkbutton(lfr, text="Stop",  command=function() {})
  bclose <- tcltk::tkbutton(lfr, text="Close", command=function() {
    if (!is.na(oldverb) && igraph_opt("verbose") == "tkconsole") {
      igraph_options(verbose=oldverb)
    }
    tcltk::tkdestroy(console) })

  tcltk::tkpack(logo, side="top", fill="none", expand=0, anchor="n",
         ipadx=10, ipady=10)
  tcltk::tkpack(bclear, side="top", fill="x", expand=0, padx=10)
  ## tcltk::tkpack(bstop, side="top", fill="x", expand=0, padx=10)
  tcltk::tkpack(bclose, side="top", fill="x", expand=0, padx=10)  
  
  tcltk::tkpack(lfr, side="left", fill="none", expand=0, anchor="n")
  tcltk::tkpack(pbar$frame, side="bottom", fill="x", expand=0)
  tcltk::tkpack(scr, side="right", fill="y", expand=0)
  tcltk::tkpack(txt, side="left", fill="both", expand=1)

  tcltk::tkbind(console, "<Destroy>", function() {
    if (!is.na(oldverb) && igraph_opt("verbose") == "tkconsole") {
      igraph_options(verbose=oldverb)
    }
    assign(".igraph.pb", NULL, envir=asNamespace("igraph"))
  })
  
  res <- list(top=console, txt=txt, pb=pbar$pb, oldverb=oldverb)
  class(res) <- "igraphconsole"
  res
}

.igraph.progress.tkconsole.message <- function(message, start=FALSE) {
  txt <- get(".igraph.pb", asNamespace("igraph"))$txt
  if (is.null(txt)) {
    if (start) {
      pb <- .igraph.progress.tkconsole.create(NA)
      assign(".igraph.pb", pb, envir=asNamespace("igraph"))
      txt <- pb$txt
    } else { 
      return()
    }
  }
  tcltk::tkconfigure(txt, state="normal")
  now <- paste(sep="", substr(date(), 5, 19), ": ")
  s1 <- grepl("^ ", message)
  if (!s1) { tcltk::tkinsert(txt, "insert", now) }
  tcltk::tkinsert(txt, "insert", message)
  tcltk::tksee(txt, "end")
  tcltk::tkconfigure(txt, state="disabled")
  tcltk::tcl("update", "idletasks")
}

close.igraphconsole <- function(con, ...) {
  invisible()
}

## Much of this is from tkProgressbar

.igraph.progress.tkconsole.pbar <- function(top) {
  useText <- FALSE
  have_ttk <- as.character(tcltk::tcl("info", "tclversion")) >= "8.5"
  if (!have_ttk && as.character(tcltk::tclRequire("PBar")) == "FALSE") 
    useText <- TRUE
  fn <- tcltk::tkfont.create(family = "helvetica", size = 10)
  frame <- tcltk::tkframe(top)
  if (useText) {
    .lab <- tcltk::tklabel(frame, text = " ", font = fn, anchor="w",
                    padx = 20)
    tcltk::tkpack(.lab, side = "left", anchor="w", padx=5)
    fn2 <- tcltk::tkfont.create(family = "helvetica", size = 12)
    .vlab <- tcltk::tklabel(frame, text = "0%", font = fn2, padx = 20)
    tcltk::tkpack(.vlab, side = "right")
  } else {
    .lab <- tcltk::tklabel(frame, text = " ", font = fn, anchor="w",
                    pady = 5)
    tcltk::tkpack(.lab, side = "top", anchor="w", padx=5)
    tcltk::tkpack(tcltk::tklabel(frame, text = "", font = fn), side = "bottom")
    .val <- tcltk::tclVar()
    pBar <- if (have_ttk) {
      tcltk::ttkprogressbar(frame, length = 300, variable=.val)
    } else {
      tcltk::tkwidget(frame, "ProgressBar", width = 300, variable=.val)
    }
    tcltk::tkpack(pBar, side = "bottom", anchor="w", padx=5)
  }
  get <- function(w) { return(tcltk::tclvalue(.val)); }
  set <- function(w, val) { tcltk::tclvalue(.val) <<- val }
  pb <- list(widget=pBar, get=get, set=set, label=.lab)
  list(frame=frame, pb=pb)
}

#' The igraph console
#' 
#' The igraph console is a GUI windows that shows what the currently running
#' igraph function is doing.
#' 
#' The console can be started by calling the \code{console} function.
#' Then it stays open, until the user closes it.
#' 
#' Another way to start it to set the \code{verbose} igraph option to
#' \dQuote{tkconsole} via \code{igraph_options}. Then the console (re)opens
#' each time an igraph function supporting it starts; to close it, set the
#' \code{verbose} option to another value.
#' 
#' The console is written in Tcl/Tk and required the \code{tcltk} package.
#' 
#' @aliases igraph.console
#' @return \code{NULL}, invisibly.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{igraph_options}} and the \code{verbose} option.
#' @keywords graphs
#' @export

console <- function() {
  oldverb <- igraph_opt("verbose")
  igraph_options(verbose="tkconsole")
  pb <- .igraph.progress.tkconsole.create(oldverb)
  assign(".igraph.pb", pb, envir=asNamespace("igraph"))  
  .igraph.progress.tkconsole.message("Console started.\n")
  invisible()
}
