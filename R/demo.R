#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
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



#' Run igraph demos, step by step
#' 
#' Run one of the accompanying igraph demos, somewhat interactively, using a Tk
#' window.
#' 
#' This function provides a somewhat nicer interface to igraph demos that come
#' with the package, than the standard \code{\link{demo}} function. Igraph
#' demos are divided into chunks and \code{igraph_demo} runs them chunk by
#' chunk, with the possibility of inspecting the workspace between two chunks.
#' 
#' The \code{tcltk} package is needed for \code{igraph_demo}.
#'
#' @aliases igraphdemo
#' @param which If not given, then the names of the available demos are listed.
#' Otherwise it should be either a filename or the name of an igraph demo.
#' @return Returns \code{NULL}, invisibly.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{demo}}
#' @export
#' @keywords graphs
#' @examples
#' 
#' igraph_demo()
#' if (interactive()) {
#'   igraph_demo("centrality")
#' }
#' 
igraph_demo <- function(which) {
  
  if (missing(which)) {
    demodir <- system.file("demo", package="igraph")
    if (demodir=="") {
      stop("Could not find igraph demos, broken igraph installation?")
    }
    return( sub("\\.R$", "", list.files(demodir)) )
  }

  if (!grepl("\\.R$", which)) {
    which <- paste(which, sep=".", "R")
  }

  if (!file.exists(which) && ! grepl("^/", which)) {
    which <- system.file( paste("demo", sep="/", which), package="igraph" )
  }

  if (which=="" || !file.exists(which)) {
    stop("Could not find demo file")
  }
  
  .igraphdemo.next <- function(top, txt) {
    act <- as.character(tcltk::tktag.nextrange(txt, "active", "0.0"))
    if (length(act)==0) {
      return()
    }

    options(keep.source=TRUE)
    
    text <- tcltk::tclvalue(tcltk::tkget(txt, act[1], act[2]))
    cat("=======================================================\n");

    expr <- parse(text=text)
    for (i in seq_along(expr)) {
      co <- as.character(attributes(expr)$srcref[[i]])
      co[1] <- paste("> ", sep="", co[1])
      if (length(co)>1) {
        co[-1] <- paste(" +", sep="", co[-1])
      }
      cat(co, sep="\n")
      res <- withVisible(eval(expr[[i]], envir=.GlobalEnv))
      if (res$visible) {
        print(res$value)
      }
    }
    cat("> -------------------------------------------------------\n");
    cat(options()$prompt)
    
    tcltk::tktag.remove(txt, "activechunk", act[1], act[2])
    tcltk::tktag.remove(txt, "active", act[1], act[2])

    nex <- as.character(tcltk::tktag.nextrange(txt, "activechunk", act[1]))
    if (length(nex)!=0) {
      tcltk::tktag.add(txt, "active", nex[1], nex[2])
      tcltk::tksee(txt, paste(sep="", as.numeric(nex[2]), ".0"))
      tcltk::tksee(txt, paste(sep="", as.numeric(nex[1]), ".0"))
    }
  }
  
  .igraphdemo.close <- function(top) {
    tcltk::tkdestroy(top)
  }
  
  .igraphdemo.reset <- function(top, txt, which) {
    demolines <- readLines(which)
    demolines <- demolines[!grepl("^pause\\(\\)$", demolines)]
    demolines <- paste(" ", sep="", demolines)

    ch <- grep("^[ ]*###", demolines)
    ch <- c(ch, length(demolines)+1)
    if (length(ch)==1) {
      warning("Demo source file does not contain chunks")
    } else {
      demolines <- demolines[ch[1]:length(demolines)]
      ch <- grep("^[ ]*###", demolines)
      ch <- c(ch, length(demolines)+1)
    }
    
    tcltk::tkconfigure(txt, state="normal")
    tcltk::tkdelete(txt, "0.0", "end")
    tcltk::tkinsert(txt, "insert", paste(demolines, collapse="\n"))
    tcltk::tkconfigure(txt, state="disabled")

    for (i in seq_along(ch[-1])) {
      from <- paste(sep="", ch[i], ".0")
      to <- paste(sep="", ch[i+1]-1, ".0")
      tcltk::tktag.add(txt, "chunk", from, to)
      tcltk::tktag.add(txt, "activechunk", from, to)
    }
    tcltk::tktag.configure(txt, "chunk", "-borderwidth", "1")
    tcltk::tktag.configure(txt, "chunk", "-relief", "sunken")
    if (length(ch) >= 2) {
      tcltk::tktag.add(txt, "active", paste(sep="", ch[1], ".0"),
                paste(sep="", ch[2]-1, ".0"))
      tcltk::tktag.configure(txt, "active", "-foreground", "red")
      tcltk::tktag.configure(txt, "active", "-background", "lightgrey")
    }

    comm <- grep("^#", demolines)
    for (i in comm) {
      tcltk::tktag.add(txt, "comment", paste(sep="", i, ".0"),
                paste(sep="", i, ".end"))
    }
    tcltk::tktag.configure(txt, "comment", "-font", "bold")
    tcltk::tktag.configure(txt, "comment", "-foreground", "darkolivegreen")
  }

  top <- tcltk::tktoplevel(background="lightgrey")
  tcltk::tktitle(top) <- paste("igraph demo:", which)
  
  main.menu <- tcltk::tkmenu(top)
  tcltk::tkadd(main.menu, "command", label="Close", command=function()
        .igraphdemo.close(top))
  tcltk::tkadd(main.menu, "command", label="Reset", command=function()
        .igraphdemo.reset(top, txt, which))
  tcltk::tkconfigure(top, "-menu", main.menu)

  scr <- tcltk::tkscrollbar(top, repeatinterval=5,
                     command=function(...) tcltk::tkyview(txt,...))
  txt <- tcltk::tktext(top, yscrollcommand=function(...) tcltk::tkset(scr, ...),
                width=80, height=40)
  but <- tcltk::tkbutton(top, text="Next", command=function()
                  .igraphdemo.next(top, txt))
  
  tcltk::tkpack(but, side="bottom", fill="x", expand=0)
  tcltk::tkpack(scr, side="right", fill="y", expand=0)
  tcltk::tkpack(txt, side="left", fill="both", expand=1)

  .igraphdemo.reset(top, txt, which)
  
  invisible()
}
