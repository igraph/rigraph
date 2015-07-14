#   IGraph R package
#   Copyright (C) 2009-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

# TODO LIST:
#   * adding edges to a graph
#   * exporting graphics
#   * scroll bar for the graph list area   == IMPOSSIBLE right now, should be a list
#   * window title in the error dialog
#   * keyboard shortcuts
#   * implement min & max in .tkigraph.dialog

.tkigraph.env <- new.env()



#' Experimental basic igraph GUI
#' 
#' This functions starts an experimental GUI to some igraph functions. The GUI
#' was written in Tcl/Tk, so it is cross platform.
#' 
#' \code{tkigraph} has its own online help system, please see that for the
#' details about how to use it.
#' 
#' @return Returns \code{NULL}, invisibly.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{tkplot}} for interactive plotting of graphs.
#' @keywords graphs
#' @export

tkigraph <- function() {

  requireNamespace("tcltk", quietly = TRUE) ||
    stop("tcl/tk library not available")

  options(scipen=10000)
  
  if (!exists("window", envir=.tkigraph.env, inherits=FALSE)) {
    assign("window", TRUE, envir=.tkigraph.env)
    assign("graphs", list(), envir=.tkigraph.env)
    assign("selected", list(), envir=.tkigraph.env)
    assign("tklines", list(), envir=.tkigraph.env)
  } else {
    stop("tkigraph window is already open!")
  }
  
  # Create top window
  top <- tcltk::tktoplevel(background="lightgrey", width=700, height=400)
  tcltk::tktitle(top) <- "iGraph GUI (Social Network Basics)"
  topframe <- tcltk::tkframe(top, relief="sunken", borderwidth=1)
  scr <- tcltk::tkscrollbar(top, repeatinterval=5,
                     command=function(...) tcltk::tkyview(topframe))
  tcltk::tkplace(topframe, x=0, y=0, relwidth=1.0)
  
  # Store myself in the environment if needed
  if (!exists("top", envir=.tkigraph.env, inherits=FALSE)) {
    assign("top", top, envir=.tkigraph.env)
    assign("topframe", topframe, envir=.tkigraph.env)
  }
  
  # kill myself if window was closed
  tcltk::tkbind(top, "<Destroy>", function() .tkigraph.close())

  # pull-down menu
  main.menu <- tcltk::tkmenu(top)

  graph.menu <- tcltk::tkmenu(main.menu)
  
  create.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(create.menu, "command", label="By hand", command=function() {
    .tkigraph.by.hand()
  })
  tcltk::tkadd(create.menu, "separator")
  tcltk::tkadd(create.menu, "command", label="Ring", command=function() {
    .tkigraph.ring()
  })
  tcltk::tkadd(create.menu, "command", label="Tree", command=function() {
    .tkigraph.tree()
  })
  tcltk::tkadd(create.menu, "command", label="Lattice", command=function() {
    .tkigraph.lattice()
  })
  tcltk::tkadd(create.menu, "command", label="Star", command=function() {
    .tkigraph.star()
  })
  tcltk::tkadd(create.menu, "command", label="Full", command=function() {
    .tkigraph.full()
  })
  tcltk::tkadd(create.menu, "separator")
  tcltk::tkadd(create.menu, "command", label="Graph atlas...", command=function() {
    .tkigraph.atlas()
  })
  tcltk::tkadd(create.menu, "separator")
  tcltk::tkadd(create.menu, "command", label="Moody-White network", command=function() {
    g <- graph_from_adjacency_matrix(.tkigraph.net.moody.white, mode="undirected")
    g <- set_graph_attr(g, "name", "Moody-White network")
    .tkigraph.add.graph(g)
  })
  
  tcltk::tkadd(create.menu, "separator") 
  tcltk::tkadd(create.menu, "command", label="Random (Erdos-Renyi G(n,p))",
        command=function() {
          .tkigraph.erdos.renyi.game()
        })
  tcltk::tkadd(create.menu, "command", label="Random (Erdos-Renyi G(n,m))",
        command=function() { .tkigraph.erdos.renyi.gnm.game() })
  tcltk::tkadd(create.menu, "command", label="Random (Barabasi-Albert)",
        command=function() {
          .tkigraph.barabasi.game()
        })
  tcltk::tkadd(create.menu, "command", label="Random (Configuration model)",
        command=function() {
          .tkigraph.degree.sequence.game()
        })
  tcltk::tkadd(create.menu, "command", label="Watts-Strogatz random graph",
        command=function() {
          .tkigraph.watts.strogatz()
        })
  tcltk::tkadd(create.menu, "separator")
  tcltk::tkadd(create.menu, "command", label="Simplify", command=function() {
    .tkigraph.simplify()
  })
  tcltk::tkadd(graph.menu, "cascade", label="Create", menu=create.menu)
  tcltk::tkadd(graph.menu, "command", label="Delete", command=function() {
    .tkigraph.delete() })  
  tcltk::tkadd(graph.menu, "separator")
  tcltk::tkadd(graph.menu, "command", label="Show graph",
        command=function() { .tkigraph.show() })
  tcltk::tkadd(graph.menu, "command", label="Basic statistics",
        command=function() { .tkigraph.stat() })
  tcltk::tkadd(graph.menu, "separator")
  tcltk::tkadd(graph.menu, "command", label="Import session", command=function() {
    .tkigraph.load()
  })
#  tcltk::tkadd(graph.menu, "command", label="Load from the Web", command=function() {
#    .tkigraph.load.online()
#  })
  tcltk::tkadd(graph.menu, "command", label="Export session", command=function() {
    .tkigraph.save()
  })
  tcltk::tkadd(graph.menu, "separator")
  tcltk::tkadd(graph.menu, "command", label="Import adjacency matrix",
        command=function() .tkigraph.import.adjacency())
  tcltk::tkadd(graph.menu, "command", label="Import edge list",
        command=function() .tkigraph.import.edgelist())
  tcltk::tkadd(graph.menu, "command", label="Import Pajek file",
        command=function() .tkigraph.import.pajek())
  tcltk::tkadd(graph.menu, "command", label="Export adjacency matrix",
        command=function() .tkigraph.export.adjacency())
  tcltk::tkadd(graph.menu, "command", label="Export edge list",
        command=function() .tkigraph.export.edgelist())
  tcltk::tkadd(graph.menu, "command", label="Export Pajek file",
        command=function() .tkigraph.export.pajek())
  tcltk::tkadd(main.menu, "cascade", label="Graph", menu=graph.menu)

  plot.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(plot.menu, "command", label="Simple", command=function() {
    .tkigraph.plot(simple=TRUE)
  })
  tcltk::tkadd(plot.menu, "command", label="Advanced", command=function() {
    .tkigraph.plot(simple=FALSE)
  })
  tcltk::tkadd(main.menu, "cascade", label="Draw", menu=plot.menu)
  
  centrality.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(centrality.menu, "command", label="Degree (out)", command=function() {
    .tkigraph.degree("out")
  })
  tcltk::tkadd(centrality.menu, "command", label="Degree (in)", command=function() {
    .tkigraph.degree("in")
  })
  tcltk::tkadd(centrality.menu, "command", label="Degree (total)",
        command=function() {
          .tkigraph.degree("total")
        })
  tcltk::tkadd(centrality.menu, "command", label="Plot log-log degree distribution",
        command=function() {
          .tkigraph.degree.dist(power=FALSE)
        })
  tcltk::tkadd(centrality.menu, "command", label="Fit a power-law to degree distribution",
        command=function() {
          .tkigraph.degree.dist(power=TRUE)
        })
  tcltk::tkadd(centrality.menu, "separator")
  tcltk::tkadd(centrality.menu, "command", label="Closeness", command=function() {
    .tkigraph.closeness()
  })
  tcltk::tkadd(centrality.menu, "command", label="Betweenness", command=function() {
    .tkigraph.betweenness()
  })
  tcltk::tkadd(centrality.menu, "command", label="Burt's constraint", command=function() {
    .tkigraph.constraints()
  })
  tcltk::tkadd(centrality.menu, "command", label="Page rank", command=function() {
    .tkigraph.page.rank()
  })
  tcltk::tkadd(centrality.menu, "separator")  
  tcltk::tkadd(centrality.menu, "command", label="Edge betweenness",
        command=function() {
          .tkigraph.edge.betweenness()
        })
  tcltk::tkadd(main.menu, "cascade", label="Centrality", menu=centrality.menu)

  distances.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(distances.menu, "command", label="Distance matrix",
        command=function() { .tkigraph.dist.matrix() })
  tcltk::tkadd(distances.menu, "command", label="Distances from/to vertex",
        command=function() { .tkigraph.distance.tofrom() })
  tcltk::tkadd(distances.menu, "command", label="Diameter (undirected)",
        command=function() { .tkigraph.diameter() })
  tcltk::tkadd(distances.menu, "command", label="Draw diameter",
        command=function() { .tkigraph.plot.diameter(simple=FALSE) })
  tcltk::tkadd(distances.menu, "command", label="Average path length (undirected)",
        command=function() { .tkigraph.diameter(mode="path") })
  tcltk::tkadd(main.menu, "cascade", label="Distances", menu=distances.menu)

  component.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(component.menu, "command", label="Show components",
        command=function() { .tkigraph.clusters() })
  tcltk::tkadd(component.menu, "command", label="Show membership",
        command=function() { .tkigraph.clusters.membership() })
  tcltk::tkadd(component.menu, "command", label="Calculate component sizes",
        command=function() { .tkigraph.calculate.clusters() })
  tcltk::tkadd(component.menu, "command", label="Draw components",
        command=function() { .tkigraph.plot.comp(simple=FALSE) })
  tcltk::tkadd(component.menu, "command", label="Create graph from giant component",
        command=function() { .tkigraph.create.giantcomp() })
  tcltk::tkadd(component.menu, "command", label="Create graph from component of a vertex",
        command=function() { .tkigraph.create.mycomp() })
  tcltk::tkadd(component.menu, "command", label="Create graph from a component",
        command=function() { .tkigraph.create.comp() })

  community.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(community.menu, "command", label="Spinglass algorithm",
        command=function() { .tkigraph.spinglass() })
  tcltk::tkadd(community.menu, "command", label="Spinglass algorithm, single vertex",
        command=function() { .tkigraph.my.spinglass() })

  cohesion.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(cohesion.menu, "command", label="Cohesion of all components",
        command=function() { .tkigraph.cohesion() })
  
  subgraph.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(subgraph.menu, "cascade", label="Components", menu=component.menu)
  tcltk::tkadd(subgraph.menu, "cascade", label="Communities", menu=community.menu)
  tcltk::tkadd(subgraph.menu, "cascade", label="Cohesion", menu=cohesion.menu)
  
  tcltk::tkadd(main.menu, "cascade", label="Subgraphs", menu=subgraph.menu)
  
  motif.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(motif.menu, "command", label="Draw motifs", command=function() {
    .tkigraph.motifs.draw()
  })
  tcltk::tkadd(motif.menu, "command", label="Find motifs", command=function() {
    .tkigraph.motifs.find()
  })
  tcltk::tkadd(main.menu, "cascade", label="Motifs", menu=motif.menu)

  help.menu <- tcltk::tkmenu(main.menu)
  tcltk::tkadd(help.menu, "command", label="Contents", command=function() { .tkigraph.help() })
  tcltk::tkadd(help.menu, "command", label="In external browser",
        command=function() { .tkigraph.help.external() })
  tcltk::tkadd(help.menu, "separator")
  tcltk::tkadd(help.menu, "command", label="About", command=function() { .tkigraph.about() })
  tcltk::tkadd(main.menu, "cascade", label="Help", menu=help.menu)
  
  tcltk::tkadd(main.menu, "command", label="Quit", command=.tkigraph.close)
  
  tcltk::tkconfigure(top, "-menu", main.menu)

  # Set up the main area
  tcltk::tkgrid(tcltk::tklabel(top, text=""),
         tcltk::tklabel(top, text="#", justify="center", relief="raised"),
         tcltk::tklabel(top, text="Name", width=50, relief="raised",
                 justify="left"),
         tcltk::tklabel(top, text="|V|", width=6, relief="raised",
                 justify="left"),
         tcltk::tklabel(top, text="|E|", width=6, relief="raised",
                 justify="left"),
         tcltk::tklabel(top, text="Dir.", width=6, relief="raised",
                 justify="left"),
         sticky="nsew", "in"=topframe)
  tcltk::tkgrid.columnconfigure(topframe, 2, weight=1)

  invisible(NULL)
}

.tkigraph.close <- function() {
  message <- "Are you sure?"
  yesno <- tcltk::tkmessageBox(message=message, icon="question", type="yesno",
                        default="yes")
  if (as.character(yesno) == "no") { return() }
  top <- get("top", .tkigraph.env)
  tcltk::tkbind(top, "<Destroy>", "")
  tcltk::tkdestroy(top)
  rm(list=ls(envir=.tkigraph.env), envir=.tkigraph.env)
}

.tkigraph.get.selected <- function() {
  gnos <- get("selected", .tkigraph.env)
  which(as.logical(sapply(gnos, tcltk::tclvalue)))
}

.tkigraph.error <- function(message) {
  tcltk::tkmessageBox(message=message, icon="error", type="ok")
}

.tkigraph.warning <- function(message) {
  tcltk::tkmessageBox(message=message, icon="warning", type="ok")
}

.tkigraph.dialogbox <- function(TITLE="Setup parameters", ...) {
  
  params <- list(...)
  answers <- lapply(params, "[[", "default")
  dialog <- tcltk::tktoplevel()
  frame <- tcltk::tkframe(dialog)
  tcltk::tkgrid(frame)
  tcltk::tktitle(dialog) <- TITLE
  vars <- lapply(answers, tcltk::tclVar)
  retval <- list()
  widgets <- list()

  OnOK <- function() {
    retval <<- lapply(vars, tcltk::tclvalue)
    for (i in seq(along=params)) {
      if (params[[i]]$type == "listbox") {
        retval[[i]] <<- as.numeric(tcltk::tclvalue(tcltk::tkcurselection(widgets[[i]])))
      }
    }
    tcltk::tkdestroy(dialog)    
  }

  tcltk::tkgrid(tcltk::tklabel(dialog, text=TITLE,
                 font=tcltk::tkfont.create(family="times", size="16", weight="bold")),
         columnspan=2, sticky="nsew", "in"=frame, padx=10, pady=10)
  
  OK.but <- tcltk::tkbutton(dialog, text="   OK    ", command=OnOK)
  for (i in seq(along=params)) {
    tcltk::tkgrid(tcltk::tklabel(dialog, text=params[[i]]$name),
           column=0, row=i, sticky="nw", padx=10, "in"=frame)
    if (params[[i]]$type == "numeric" || params[[i]]$type == "text") {
      tmp <- tcltk::tkentry(dialog, width="10", textvariable=vars[[i]])
      tcltk::tkgrid(tmp, column=1, row=i, sticky="nsew", padx=10, "in"=frame)
      tcltk::tkbind(tmp, "<Return>", OnOK)
    } else if (params[[i]]$type == "boolean") {
      b <- tcltk::tkcheckbutton(dialog, onvalue="TRUE", offvalue="FALSE",
                           variable=vars[[i]])
      if (params[[i]]$default == "TRUE") { tcltk::tkselect(b) }
      tcltk::tkgrid(b, column=1, row=i, sticky="w", padx=10, "in"=frame)
    } else if (params[[i]]$type == "listbox") {
      f <- tcltk::tkframe(dialog)
      tcltk::tkgrid(f, "in"=frame, padx=10, sticky="nsew", column=1, row=i)
      scr <- tcltk::tkscrollbar(f, repeatinterval=5)
      fun <- eval(eval(substitute(expression(function(...) tcltk::tkset(scr,...)),
                                  list(scr=scr))))
      lb <- tcltk::tklistbox(f, selectmode="single", exportselection=FALSE,
                      height=3, yscrollcommand=fun)
      fun <- eval(eval(substitute(expression(function(...) tcltk::tkyview(lb, ...)),
          list(lb=lb))))
      tcltk::tkconfigure(scr, "-command", fun)
      tcltk::tkselection.set(lb, as.numeric(params[[i]]$default)+1)
      lapply(params[[i]]$values, function(l) tcltk::tkinsert(lb, "end", l))
      tcltk::tkselection.set(lb, as.numeric(params[[i]]$default))
      tcltk::tkgrid(lb, scr, sticky="nsew", "in"=f)
      tcltk::tkgrid.configure(scr, sticky="nsw")
      tcltk::tkgrid.columnconfigure(f, 0, weight=1)
      widgets[[i]] <- lb
    }
  }
  tcltk::tkgrid(OK.but, column=0, columnspan=2, sticky="nsew", "in"=frame, pady=10,
         padx=10)
  tcltk::tkgrid.columnconfigure(frame, 1, weight=1)
  tcltk::tkwait.window(dialog)

  for (i in seq(retval)) {
    if (params[[i]]$type == "numeric") {
      retval[[i]] <- eval(parse(text=retval[[i]]))
    } else if (params[[i]]$type == "text") {
      retval[[i]] <- eval(retval[[i]])
    } else if (params[[i]]$type == "boolean") {
      if (retval[[i]] == "FALSE") {
        retval[[i]] <- FALSE
      } else {
        retval[[i]] <- TRUE
      }
    } else if (params[[i]]$type == "listbox") {
      ## nothing to do
    }
  }
  names(retval) <- names(params)
  return (retval)  
}

.tkigraph.add.graph <- function(g) {
  top <- get("top", .tkigraph.env)
  topframe <- get("topframe", .tkigraph.env)

  ## add 'name' attribute if not present
  if (!"name" %in% vertex_attr_names(g)) {
    V(g)$name <- as.integer(seq(vcount(g)))
  }
  if (!"name" %in% edge_attr_names(g)) {
    E(g)$name <- as.integer(seq(ecount(g)))
  }
  
  graphs <- get("graphs", .tkigraph.env)
  selected <- get("selected", .tkigraph.env)
  assign("graphs", append(graphs, list(g)), .tkigraph.env)
  no <- length(graphs)+1

  selected[[no]] <- tcltk::tclVar("FALSE")
  assign("selected", selected, .tkigraph.env)

  name <- graph_attr(g, "name")
  tmpvar <- tcltk::tclVar(as.character(name))
  but <- tcltk::tkcheckbutton(top, onvalue="TRUE", offvalue="FALSE",
                       variable=selected[[no]])
  lab <- tcltk::tklabel(top, text=as.character(no), width=2)
  ent <- tcltk::tkentry(top, width=30, textvariable=tmpvar)
  lab2 <- tcltk::tklabel(top, text=as.character(vcount(g)),
                  justify="right", padx=2)
  lab3 <- tcltk::tklabel(top, text=as.character(ecount(g)), justify="right",
                  padx=2)
  lab4 <- tcltk::tklabel(top, text=if (is_directed(g)) "YES" else "NO")
  tcltk::tkgrid(but, lab, ent, lab2, lab3, lab4, "in"=topframe, sticky="nsew")

  tklines <- get("tklines", .tkigraph.env)
  tklines[[no]] <- list(but, lab, ent, lab2, lab3, lab4)
  assign("tklines", tklines, .tkigraph.env)
}

.tkigraph.delete <- function() {
  gnos <- .tkigraph.get.selected()  

  if (length(gnos) == 0) { return() }
  if (length(gnos) > 1) {
    message <- paste("Are you sure to delete", length(gnos), "graphs?")
  } else {
    message <- paste("Are you sure to delete graph #", gnos, "?")
  }
  yesno <- tcltk::tkmessageBox(message=message, icon="question", type="yesno",
                        default="yes")
  if (as.character(yesno) == "no") { return() }

  ## remove from the screen
  graphs <- get("graphs", .tkigraph.env)
  topframe <- get("topframe", .tkigraph.env)
  todel <- get("tklines", .tkigraph.env)[gnos]
  todel <- unlist(recursive=FALSE, todel)
  for (i in todel) {
    tcltk::tkgrid.remove(topframe, i)
  }
  ## delete the graphs
  graphs[gnos] <- NA
  assign("graphs", graphs, .tkigraph.env)
  selected <- get("selected", .tkigraph.env)
  for (i in gnos) { 
    selected[[i]] <- tcltk::tclVar("FALSE")
  }
  assign("selected", selected, .tkigraph.env)
}

.tkigraph.load <- function() {
  filename <- tcltk::tkgetOpenFile(defaultextension="Rdata",
                            title="Load graphs")
  env <- new.env()
  load(paste(as.character(filename), collapse=" "), envir=env)
  .tkigraph.graphs <- get("graphs", envir=env) 
  for (i in seq(.tkigraph.graphs)) {
    .tkigraph.add.graph(.tkigraph.graphs[[i]])
  }
  if (".tkigraph.graphs" %in% ls(all.names=TRUE)) {
    rm(.tkigraph.graphs)
  }
}

.tkigraph.load.online <- function() {
  ## TODO
}

.tkigraph.save <- function() {
  graphs <- get("graphs", .tkigraph.env)
  topframe <- get("topframe", .tkigraph.env)
  for (i in seq(graphs)) {
    if (is.na(graphs)[i]) { next }
    entry <- tcltk::tkgrid.slaves(topframe, row=i, col=2)
    graphs[[i]] <- set_graph_attr(graphs[[i]], "name",
                                       as.character(tcltk::tcl(entry, "get")))
  }
  graphs <- graphs[ !is.na(graphs) ]
  filename <- tcltk::tkgetSaveFile(initialfile="graphs.Rdata",
                            defaultextension="Rdata",
                            title="Save graphs")
  save(graphs, file=paste(as.character(filename), collapse=" "))
}

#' @importFrom utils read.table

.tkigraph.import.adjacency <- function() {
  filename <- tcltk::tkgetOpenFile(defaultextension="adj",
                            title="Import adjacency matrix")
  filename <- paste(as.character(filename), collapse=" ")
  if (filename=="") { return() }
  tab <- read.table(filename)
  tab <- as.matrix(tab)
  if (ncol(tab) != nrow(tab)) {
    .tkigraph.error("Cannot interpret as adjacency matrix")
    return()
  }
  dir <- if (all(t(tab)==tab)) "undirected" else "directed"
  if (all(unique(tab) %in% c(0,1))) {
    weighted <- NULL
  } else {
    weighted <- "weight"
  }
  g <- .tkigraph.graph.adjacency(tab, mode=dir, weighted=weighted)
  g <- set_graph_attr(g, "name", "Imported adjacency matrix")
  .tkigraph.add.graph(g)
}

.tkigraph.graph.adjacency <- function(adjmatrix, mode, weighted) {
  if (is.null(weighted)) {
    g <- graph_from_adjacency_matrix(adjmatrix, mode=mode)
  } else {
    ## there is bug in the currect igraph version, this is a workaround
    if (mode=="undirected") {
      adjmatrix[ lower.tri(adjmatrix) ] <- 0
    }
    g <- graph_from_adjacency_matrix(adjmatrix, mode=mode, weighted=weighted)
  }
  g
}

#' @importFrom utils read.table

.tkigraph.import.edgelist <- function() {
  filename <- tcltk::tkgetOpenFile(defaultextension="el",
                            title="Import edge list")
  filename <- paste(as.character(filename), collapse=" ")
  if (filename=="") { return() }
  tab <- read.table(filename,
                    colClasses="character")
  cn <- rep("", ncol(tab))
  if (ncol(tab)>=3) { cn[3] <- "weight" }
  colnames(tab) <- cn
  read <- .tkigraph.dialogbox(TITLE="Importing an edge list",
                              directed=list(name="Directed", type="boolean",
                                default="FALSE"))
  g <- graph_from_data_frame(tab, directed=read$directed)
  g <- set_graph_attr(g, "name", "Imported edge list")
  .tkigraph.add.graph(g)
}

.tkigraph.import.pajek <- function() {
  filename <- tcltk::tkgetOpenFile(defaultextension="net",
                            title="Import Pajek file")
  filename <- paste(as.character(filename), collapse=" ")
  if (filename=="") { return() }
  g <- read_graph(file=filename, format="pajek")
  color <- NULL # To eliminate a check NOTE
  if ("color" %in% vertex_attr_names(g)) { V(g)[ color=="" ]$color <- "black" }
  if ("color" %in% edge_attr_names(g)) { E(g)[ color=="" ]$color <- "black" }
  g <- set_graph_attr(g, "name", "Imported Pajek fie")
  .tkigraph.add.graph(g)
}

#' @importFrom utils write.table

.tkigraph.export.adjacency <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  if ("weight" %in% graph_attr_names(graph)) {
    tab <- as_adj(graph, attr="weight", names=FALSE, sparse=FALSE)
  } else {
    tab <- as_adj(graph, names=FALSE, sparse=FALSE)
  }
  filename <- tcltk::tkgetSaveFile(initialfile="graph.adj",
                            defaultextension="adj",
                            title="Export adjacency matrix")
  filename <- paste(as.character(filename), collapse=" ")
  if (filename=="") { return() }
  write.table(tab, file=filename, row.names=FALSE, col.names=FALSE)
}

#' @importFrom utils write.table

.tkigraph.export.edgelist <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  el <- as_edgelist(graph)
  if ("weight" %in% edge_attr_names(graph)) {
    el <- cbind(el, E(graph)$weight)
  }
  filename <- tcltk::tkgetSaveFile(initialfile="graph.el",
                            defaultextension="el",
                            title="Export edge list")
  filename <- paste(as.character(filename), collapse=" ")
  if (filename=="") { return() }
  write.table(el, file=filename,
              row.names=FALSE, col.names=FALSE)
}

.tkigraph.export.pajek <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  filename <- tcltk::tkgetSaveFile(initialfile="pajek.net",
                            defaultextension="net",
                            title="Export Pajek file")
  filename <- paste(as.character(filename), collapse=" ")
  if (filename=="") { return() }
  write_graph(graph, file=filename, format="pajek")
}

.tkigraph.show <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  el <- as_edgelist(graphs[[gnos]])
  el <- data.frame(from=el[,1], to=el[,2])
#  if (any(V(graphs[[gnos]])$name != seq(length=vcount(graphs[[gnos]])))) {
#    el2 <- as_edgelist(graphs[[gnos]], names=FALSE)
#    el <- cbind(el, el2)
#  }
  if ("weight" %in% edge_attr_names(graphs[[gnos]])) {
    el <- cbind(el, value=E(graphs[[gnos]])$weight)
  }

  .tkigraph.showData(el, title=paste(sep="", "Graph #", gnos), right=FALSE)
}

.tkigraph.stat <- function() {
  gnos <- .tkigraph.get.selected()

  if (length(gnos) == 0) {
    .tkigraph.error("Please select some graphs")
    return()
  }

  read <- .tkigraph.dialogbox(TITLE="Choose statistics",
                              vertices=list(name="Vertices", type="boolean",
                                default="FALSE"),
                              edges=list(name="Edges", type="boolean",
                                default="FALSE"),
                              recip=list(name="Reciprocity", type="boolean",
                                default="FALSE"),
                              dens=list(name="Density", type="boolean",
                                default="FALSE"),
                              trans=list(name="Transitivity (global)",
                                type="boolean", default="FALSE"),
                              ltrans=list(name="Mean local transitivity",
                                type="boolean", default="FALSE"),
                              deg=list(name="Average degree",
                                type="boolean", default="FALSE"),
                              maxdeg=list(name="Maximum degree (total)",
                                type="boolean", default="FALSE"),
                              maxindeg=list(name="Maximum degree (in)",
                                type="boolean", default="FALSE"),
                              maxoutdeg=list(name="Maximum degree (out)",
                                type="boolean", default="FALSE"),
                              mindeg=list(name="Minimum degree (total)",
                                type="boolean", default="FALSE"),
                              minindeg=list(name="Minimum degree (in)",
                                type="boolean", default="FALSE"),
                              minoutdeg=list(name="Minimum degree (out)",
                                type="boolean", default="FALSE")
                              )
  
  graphs <- get("graphs", .tkigraph.env)[gnos]

  v <- e <- recip <- dens <- trans <- ltrans <- 
    deg <- maxdeg <- maxindeg <- maxoutdeg <-
      mindeg <- minindeg <- minoutdeg <- numeric()
  for (i in seq(along=gnos)) {
    if (read$vertices) {
      v[i] <- vcount( graphs[[ i ]] )
    }
    if (read$edges) {
      e[i] <- ecount( graphs[[ i ]] )
    }
    if (read$recip) {
      recip[i] <- reciprocity( graphs[[ i ]] )
    }
    if (read$dens) {
      dens[i] <- edge_density( graphs[[ i ]] )
    }
    if (read$trans) {
      trans[i] <- transitivity( graphs[[ i ]], type="global")
    }
    if (read$ltrans) {
      ltrans[i] <- transitivity( graphs[[ i ]], type="localaverage")
    }
    if (read$deg) {
      deg[i] <- mean(degree( graphs[[ i ]], mode="total"))
    }
    if (read$maxdeg) {
      maxdeg[i] <- max(degree( graphs[[ i ]], mode="total"))
    }
    if (read$maxindeg) {
      maxindeg[i] <- max(degree( graphs[[ i ]], mode="in"))
    }
    if (read$maxoutdeg) {
      maxoutdeg[i] <- max(degree( graphs[[ i ]], mode="out"))
    }
    if (read$mindeg) {
      mindeg[i] <- min(degree( graphs[[ i ]], mode="total"))
    }
    if (read$minindeg) {
      minindeg[i] <- min(degree( graphs[[ i ]], mode="in"))
    }
    if (read$minoutdeg) {
      minoutdeg[i] <- min(degree( graphs[[ i ]], mode="out"))
    }
  }

  value <- numeric()
  cn <- character()
  if (read$vertices) {
    value <- cbind(value, v)
    cn <- c(cn, "Vertices")
  }
  if (read$edges) {
    value <- cbind(value, e)
    cn <- c(cn, "Edges")
  }
  if (read$recip) {
    value <- cbind(value, recip)
    cn <- c(cn, "Reciprocity")
  }
  if (read$dens) {
    value <- cbind(value, dens)
    cn <- c(cn, "Density")
  }
  if (read$trans) {
    value <- cbind(value, trans)
    cn <- c(cn, "Transitivity")
  }
  if (read$ltrans) {
    value <- cbind(value, ltrans)
    cn <- c(cn, "Local trans.")
  }
  if (read$deg) {
    value <- cbind(value, deg)
    cn <- c(cn, "Mean degree")
  }
  if (read$maxdeg) {
    value <- cbind(value, maxdeg)
    cn <- c(cn, "Max. degree")
  }
  if (read$maxindeg) {
    value <- cbind(value, maxindeg)
    cn <- c(cn, "Max. in-deg.")
  }
  if (read$maxoutdeg) {
    value <- cbind(value, maxoutdeg)
    cn <- c(cn, "Max. out-deg.")
  }
  if (read$mindeg) {
    value <- cbind(value, mindeg)
    cn <- c(cn, "Min. deg.")
  }
  if (read$minindeg) {
    value <- cbind(value, minindeg)
    cn <- c(cn, "Min. in-deg.")
  }
  if (read$minoutdeg) {
    value <- cbind(value, minoutdeg)
    cn <- c(cn, "Min. out-deg.")
  }

  value <- t(value)
  rownames(value) <- cn
  colnames(value) <- gnos
  .tkigraph.showData(value, title="Graphs properties", sort.button=FALSE)  
}

#' @importFrom grDevices dev.new

.tkigraph.plot <- function(simple=TRUE, gnos=NULL, ...) {

  if (is.null(gnos)) {
    gnos <- .tkigraph.get.selected()
  }
  graphs <- get("graphs", .tkigraph.env)

  if (length(gnos)==0) {
    return (.tkigraph.error("Please select one or more graphs to draw."))
  }

  max.vcount <- max(sapply(graphs[gnos], vcount))
  if (max.vcount > 5000) {
    vertex.size <- 1
  } else if (max.vcount > 30) {
    vertex.size <- 3
  } else {
    vertex.size <- 15
  }

  if (!simple) {
    read <- .tkigraph.dialogbox(TITLE="Drawing graphs",
                                interactive=list(name="Interactive",
                                  type="boolean", default="FALSE"),
                                vertex.size=list(name="Vertex size",
                                  type="numeric", default=vertex.size),
                                labels=list(name="Vertex labels", type="listbox",
                                  default="3", values=c("None", "IDs", "Names",
                                                 "Labels")),
                                elabels=list(name="Edge labels", type="listbox",
                                  default="0", values=c("None", "IDs", "Names",
                                                 "Values")),
                                layout=list(name="Layout",
                                  type="listbox", default="0",
                                  values=c("Default", "Force-based (KK)",
                                    "Force-based (FR)", "Tree (RT)",
                                    "Circle", "Random")))
  } else {
    read <- list(interactive=FALSE,
                 vertex.size=vertex.size,
                 labels=3,              # labels
                 elabels=0,             # none
                 layout=0)
  }
    
  if (!read$interactive) {
    fun <- function(...) { dev.new() ; plot.igraph(...) }
  } else {
    fun <- tkplot
  }
  
  layout.default <- function(graph, layout.par) {
    if ("x" %in% vertex_attr_names(graph) &&
        "y" %in% vertex_attr_names(graph)) {
      cbind( V(graph)$x , V(graph)$y )
    } else if ("layout" %in% graph_attr_names(graph)) {
      l <- graph_attr(graph, "layout")
      if (is.function(l)) {
        l(graph)
      } else {
        l
      }
    } else if (vcount(graph) < 300 && is_connected(graph)) {
      layout_with_kk(graph)
    } else if (vcount(graph) < 1000) {
      layout_with_fr(graph)
    } else {
      layout_in_circle(graph)
    }
  }
  
  layouts <- list(layout.default, layout_with_kk,
                  layout_with_fr,
                  layout_as_tree, layout_in_circle, layout_randomly)

  if (read$vertex.size < 10) {
    label.dist <- 0.4
  } else {
    label.dist <- 0
  }
  
  for (i in gnos) {

    if (read$labels == "0") {
      labels <- NA
    } else if (read$labels == "1") {
      labels <- seq(vcount(graphs[[i]]))
    } else if (read$labels == "2") {
      labels <- V(graphs[[i]])$name
    } else if (read$labels == "3") {
      if ("label" %in% vertex_attr_names(graphs[[i]])) {
        labels <- V(graphs[[i]])$label
      } else {
        labels <- V(graphs[[i]])$name
      }
    }

    if (read$elabels == "0") {
      elabels <- NA
    } else if (read$labels == "1") {
      elabels <- seq(ecount(graphs[[i]]))
    } else if (read$labels == "2") {
      elabels <- E(graphs[[i]])$name
    } else if (read$labels == "3") {
      if ("weight" %in% edge_attr_names(graphs[[i]])) {
        elabels <- E(graphs[[i]])$weight
      } else {
        .tkigraph.warning("No edge weights, not a valued graph");
        elabels <- NA
      }
    }    

    if (vcount(graphs[[i]]) > 10) {
      eas <- 0.5
    } else {
      eas <- 1
    }
    
    g <- graphs[[i]]
    g <- delete_vertex_attr(g, "name")
    fun(g, layout=layouts[[ read$layout+1 ]],
        vertex.size=read$vertex.size, ## vertex.color=read$vertex.color,
        vertex.label=labels, vertex.label.dist=label.dist,
        edge.label=elabels, edge.arrow.size=eas,
        ...)
  }
}

#' @importFrom utils edit

.tkigraph.by.hand <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) > 1) {
    .tkigraph.error("Please select zero or one graph")
    return()
  }

  if (length(gnos)==0) {
    newdf <- edit(data.frame(list(from=character(), to=character())))
    if (ncol(newdf) > 2) {
      colnames(newdf) <- c("from", "to", "weight")
    }
    read <- .tkigraph.dialogbox(TITLE="Creating a graph by hand",
                                directed=list(name="Directed", type="boolean",
                                  default="FALSE"))
    g <- graph_from_data_frame(newdf, directed=read$directed)
    g <- set_graph_attr(g, "name", "New graph")
    .tkigraph.add.graph(g)
  } else {
    graphs <- get("graphs", .tkigraph.env)
    df <- as_edgelist(graphs[[gnos]])
    colnames <- c("from", "to")    
    if ("weight" %in% edge_attr_names(graphs[[gnos]])) {
      df <- cbind(df, E(g)$weight)
      colnames <- c("from", "to", "weight")
    }
    df <- as.data.frame(df)
        
    colnames(df) <- colnames
    df <- edit(df)
    if (ncol(df) > 2) {
      colnames(df) <- c("from", "to", "weight")
    }
    graphs[[gnos]] <- graph_from_data_frame(df, directed=is_directed(graphs[[gnos]]))
    assign("graphs", graphs, .tkigraph.env)
  }
  invisible(NULL)
}

.tkigraph.tree <- function() {
  read <- .tkigraph.dialogbox(TITLE="Regular tree",
                              n=list(name="Vertices", type="numeric",
                                default=63, min=0),
                              b=list(name="Branches", type="numeric",
                                default=2, min=1),
                              mode=list(name="Mode", type="listbox",
                                values=c("Directed (out)", "Directed (in)",
                                  "Undirected"), default="2"))
  read$mode <- c("out", "in", "undirected")[read$mode+1]
  g <- make_tree(n=read$n, children=read$b, mode=read$mode)
  lay <- layout_as_tree(g, root=1, mode="all")
  g <- set_graph_attr(g, "layout", lay)
  g <- set_graph_attr(g, "name", "Regular tree")
  .tkigraph.add.graph(g)
}

.tkigraph.ring <- function() {
  read <- .tkigraph.dialogbox(TITLE="Regular ring",
                              n=list(name="Vertices", type="numeric",
                                default=100, min=0))
  g <- make_ring(n=read$n)
  g <- set_graph_attr(g, "layout", layout_in_circle)
  g <- set_graph_attr(g, "name", "Regular ring")
  .tkigraph.add.graph(g)
}

.tkigraph.lattice <- function() {
  read <- .tkigraph.dialogbox(TITLE="Regular lattice",
                              dim=list(name="Dimensions", type="numeric",
                                default=2, min=1, max=5),
                              s1=list(name="Size 1", type="numeric",
                                default=10, min=1),
                              s2=list(name="Size 2", type="numeric",
                                default=10, min=1),
                              s3=list(name="Size 3", type="numeric",
                                default=10, min=1),
                              s4=list(name="Size 4", type="numeric",
                                default=10, min=1),
                              s5=list(name="Size 5", type="numeric",
                                default=10, min=1))
  if (read$dim > 5) { read$dim <- 5 }
  dimv <- c(read$s1, read$s2, read$s3, read$s4, read$s5)[1:read$dim]
  g <- make_lattice(dimvector=dimv)
  g <- set_graph_attr(g, "name", "Regular Lattice")
  .tkigraph.add.graph(g)
}

.tkigraph.star <- function() {
  read <- .tkigraph.dialogbox(TITLE="Star graph",
                              n=list(name="Vertices", type="numeric",
                                default=100, min=0),
                              mode=list(name="Mode", type="listbox",
                                values=c("Directed (out)", "Directed (in)",
                                  "Undirected"), default="2"))
  read$mode <- c("out", "in", "undirected")[read$mode+1]
  g <- make_star(read$n, mode=read$mode)
  g <- set_graph_attr(g, "name", "Star graph")
  .tkigraph.add.graph(g)
}

.tkigraph.full <- function() {
  read <- .tkigraph.dialogbox(TITLE="Full graph",
                              n=list(name="Vertices", type="numeric",
                                default=30, min=0),
                              directed=list(name="Directed", type="boolean",
                                default="FALSE"),
                              loops=list(name="Loops", type="boolean",
                                default="FALSE"))
  g <- make_full_graph(read$n, read$directed, read$loops)
  g <- set_graph_attr(g, "name", "Full graph")
  .tkigraph.add.graph(g)
}                             

.tkigraph.atlas <- function() {
  read <- .tkigraph.dialogbox(TITLE="Graph Atlas",
                              n=list(name="Number", type="numeric",
                                default=sample(0:1252, 1), min=0, max=1252))
  g <- graph.atlas(read$n)
  g <- set_graph_attr(g, "name",
                           paste("Graph Atlas #", read$n))
  .tkigraph.add.graph(g)
}
  
.tkigraph.erdos.renyi.game <- function() {
  read <- .tkigraph.dialogbox(TITLE="Erdos-Renyi random graph, G(n,p)",
                              n=list(name="Vertices", type="numeric",
                                default=100, min=0),
                              p=list(name="Connection probability",
                                type="numeric", default=0.02, min=0, max=1),
                              directed=list(name="Directed",
                                type="boolean", default="FALSE"))
  
  g <- sample_gnp(read$n,read$p,directed=read$directed)
  g <- set_graph_attr(g, "name", "Random graph (Erdos-Renyi G(n,p))")
  .tkigraph.add.graph(g)
}

.tkigraph.erdos.renyi.gnm.game <- function() {
  read <- .tkigraph.dialogbox(TITLE="Erdos-Renyi random graph, G(n,m)",
                              n=list(name="Vertices", type="numeric",
                                default=100, min=0),
                              m=list(name="Edges", type="numeric",
                                default=200, min=0),
                              directed=list(name="Directed",
                                type="boolean", default="FALSE"))

  g <- sample_gnm(read$n, read$m, directed=read$directed)
  g <- set_graph_attr(g, "name", "Random graph (Erdos-Renyi G(n,m))")
  .tkigraph.add.graph(g)
}

.tkigraph.barabasi.game <- function() {
  read <- .tkigraph.dialogbox(TITLE="Scale Free graph",
                              n=list(name="Vertices", type="numeric",
                                default=100, min=0),
                              m=list(name="Edges per time step",
                                type="numeric", default=1, min=0),
                              directed=list(name="Directed",
                                type="boolean", default="TRUE"))
  g <- barabasi.game(n=read$n, m=read$m, directed=read$directed)
  g <- set_graph_attr(g, "name", "Scale-free random graph")
  .tkigraph.add.graph(g)
}

#' @importFrom graphics hist plot
#' @importFrom grDevices dev.new

.tkigraph.degree.sequence.game <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) == 0) {
    .tkigraph.error("Please select at least one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)

  for (i in gnos) {
    if (is_directed(graphs[[i]])) {
      indeg <- degree(graphs[[i]], mode="in")
      outdeg <- degree(graphs[[i]], mode="out")
      g <- sample_degseq(out.deg=outdeg, in.deg=indeg)
    } else {
      deg <- degree(graphs[[i]])
      g <- sample_degseq(deg)
    }
    g <- set_graph_attr(g, "name",
                             paste(sep="", "Configuration model (#", i,")"))
    .tkigraph.add.graph(g)
  }
}

.tkigraph.watts.strogatz <- function() {
  read <- .tkigraph.dialogbox(TITLE="Watts-Strogatz graph",
                              dim=list(name="Dimensions", type="numeric",
                                default=1, min=1),
                              size=list(name="Lattice size", type="numeric",
                                default=1000, min=1),
                              nei=list(name="Neighborhood", type="numeric",
                                default=5, min=1),
                              p=list(name="Rewiring probability",
                                type="numeric", default=0.01, min=0, max=1))
  g <- sample_smallworld(dim=read$dim, size=read$size, nei=read$nei,
                           p=read$p)
  g <- set_graph_attr(g, "name", "Watts-Strogatz small-world graph")
  if (read$dim == 1) { 
    g <- set_graph_attr(g, "layout", layout_in_circle)
  }
  .tkigraph.add.graph(g)
}

.tkigraph.simplify <- function() {
  gnos <- .tkigraph.get.selected()
  graphs <- get("graphs", .tkigraph.env)

  for (i in gnos) {
    g <- simplify(graphs[[i]])
    g <- set_graph_attr(g, "name",
                             paste(sep="", "Simplification of #", i))
    .tkigraph.add.graph(g)
  }
}

#####################################################

.tkigraph.degree <- function(mode) {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  deg <- degree(graphs[[gnos]], mode=mode)
  value <- data.frame(Vertex=V(graphs[[gnos]])$name, deg)
  colnames(value) <- c("Vertex", paste(sep="","Degree (", mode, ")"))
  plot.command <- function() {
    read <- .tkigraph.dialogbox(TITLE="Plot degree distribution",
                                logx=list(name="Logarithmic `X' axis",
                                  type="boolean", default="FALSE"),
                                logy=list(name="Logarithmic `Y' axis",
                                  type="boolean", default="FALSE"),
                                hist=list(name="Histogram",
                                  type="boolean", default="FALSE"))

    if (!read$hist) {
      h <- hist(value[,2], -1:max(value[,2]), plot=FALSE)$density  
      log <- ""
      if (read$logx) { log <- paste(sep="", log, "x") }
      if (read$logy) { log <- paste(sep="", log, "y") }
      dev.new()
      plot(0:max(value[,2]), h, xlab="Degree", ylab="Relative frequency",
           type="b", main="Degree distribution", log=log)
    } else {
      dev.new()
      hist(value[,2], main="Degree distribution", xlab="Degree")
    }
  }
  value <- value[ order(value[,2], decreasing=TRUE), ]
  mv <- paste("Mean degree:", round(mean(deg), 2))
  .tkigraph.showData(value,
                     title=paste(sep="", "Degree for graph #", gnos),
                     plot.text="Plot distribution",
                     plot.command=plot.command,
                     showmean=mv)
}

#' @importFrom grDevices dev.new
#' @importFrom graphics plot hist lines legend
#' @importFrom stats coef vcov

.tkigraph.degree.dist <- function(power=FALSE) {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  read <- .tkigraph.dialogbox(TITLE="Choose degree type",
                              type=list(name="Degree type",
                                type="listbox", default="0",
                                values=c("Out", "In", "Total")))
  mode <- c("out", "in", "all")[read$type+1]
  deg <- degree(graphs[[gnos]], mode=mode)
  dev.new()
  h <- hist(deg, -1:max(deg), plot=FALSE)$density
  plot(0:max(deg), h, xlab="Degree", ylab="Relative frequency",
       type="b", main="Degree distribution", log="xy")

  if (power) {
    if (max(deg)<10) {
      .tkigraph.error("Degrees are too small for a power-law fit")
      return()
    }
    fit <- fit_power_law(deg, xmin=10)
    lines(0:max(deg), (0:max(deg))^(-coef(fit)), col="red")
    legend("topright", c(paste("exponent:", round(coef(fit), 2)),
                         paste("standard error:", round(sqrt(vcov(fit)), 2))),
           bty="n", cex=1.5)
  }
}

.tkigraph.closeness <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  cl <- closeness(graphs[[gnos]], mode="out")
  value <- data.frame(Vertex=V(graphs[[gnos]])$name, Closeness=cl)
  value <- value[ order(value[,2], decreasing=TRUE), ]
  mv <- paste("Mean value:", round(mean(cl),2))
  .tkigraph.showData(value,
                     title=paste(sep="", "Closeness for graph #", gnos),
                     showmean=mv)
}

.tkigraph.betweenness <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  btw <- betweenness(graphs[[gnos]])
  vc <- vcount(graphs[[gnos]])
  m <- (vc-1)*(vc-2)
  nbtw <- btw/m
  value <- data.frame(V(graphs[[gnos]])$name, btw, nbtw)
  colnames(value) <- c("Vertex", "Betweenness", "Normalized Betweenness")
  value <- value[ order(value[,2], decreasing=TRUE), ]
  mv <- paste("Mean value:", round(mean(btw),2), "&", round(mean(nbtw),5))
  .tkigraph.showData(value,
                     title=paste(sep="", "Betweenness for graph #", gnos),
                     showmean=mv)
}

.tkigraph.constraints <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  const <- constraint(graphs[[gnos]])
  value <- data.frame(V(graphs[[gnos]])$name, const)
  colnames(value) <- c("Vertex", "Constraint")
  value <- value[ order(value[,2], decreasing=TRUE), ]
  mv <- paste("Mean value:", round(mean(const),2))
  .tkigraph.showData(value,
                     title=paste(sep="", "Constraint for graph #", gnos),
                     showmean=mv)
}  

.tkigraph.power.centrality <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  bp <- power_centrality(graphs[[gnos]])
  value <- data.frame(V(graphs[[gnos]])$name, bp)
  colnames(value) <- c("Vertex", "Power centrality")
  value <- value[ order(value[,2], decreasing=TRUE), ]
  mv <- paste("Mean value:", round(mean(bp),2))
  .tkigraph.showData(value,
                     title=paste(sep="", "Power centrality for graph #", gnos),
                     showmean=mv)
}    

.tkigraph.page.rank <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  bp <- page_rank(graphs[[gnos]])$vector
  value <- data.frame(V(graphs[[gnos]])$name, bp)
  colnames(value) <- c("Vertex", "Page rank")
  value <- value[ order(value[,2], decreasing=TRUE), ]
  mv <- paste("Mean value:", round(mean(bp),2))
  .tkigraph.showData(value,
                     title=paste(sep="", "Page rank centrality for graph #", gnos),
                     showmean=mv)
}    

.tkigraph.edge.betweenness <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- get("graphs", .tkigraph.env)
  ebtw <- edge_betweenness(graphs[[gnos]])
  el <- as_edgelist(graphs[[gnos]])
  value <- data.frame(E(graphs[[gnos]])$name, el[,1], el[,2], ebtw)
  colnames(value) <- c("Edge", "From", "To", "Betweenness")
  value <- value[ order(value[,4], decreasing=TRUE), ]
  mv <- paste("Mean value:", round(mean(ebtw),2))
  .tkigraph.showData(value,
                     title=paste(sep="", "Edge betweenness for graph #",gnos),
                     showmean=mv)
}

#####################################################

.tkigraph.dist.matrix <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }

  graph <- get("graphs", .tkigraph.env)[[gnos]]
  if (vcount(graph) > 100) {
    .tkigraph.error("Graphs is too large to do this")
    return()
  }

  value <- distances(graph, mode="out")
  rownames(value) <- colnames(value) <- V(graph)$name
  .tkigraph.showData(value, sort.button=FALSE, 
                     title=paste(sep="", "Distance matrix for graph #", gnos))
}

.tkigraph.distance.tofrom <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }

  graph <- get("graphs", .tkigraph.env)[[gnos]]
  read <- .tkigraph.dialogbox(TITLE="Distance from a vertex",
                              v=list(name="Vertex ID", type="numeric",
                                default=1, min=1, max=vcount(graph)))
  if (read$v < 1 || read$v > vcount(graph)) {
    .tkigraph.error("Invalid vertex ID")
    return()
  }

  value <- distances(graph, read$v, mode="out")
  dim(value) <- NULL
  value <- data.frame( V(graph)$name, value)
  colnames(value) <- c("Vertex", "Distance")
  mv <- paste("Mean distance:", round(mean(value[,2]),2))
  .tkigraph.showData(value,
                     title=paste("Distance from vertex", read$v, "in graph #",
                       gnos), showmean=mv)
}

.tkigraph.diameter <- function(mode="dia") {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)==0) {
    .tkigraph.error("Please select one or more graphs")
    return()
  }

  isconn <- logical()
  dia <- numeric()
  graphs <- get("graphs", .tkigraph.env)
  for (i in seq(along=gnos)) {
    if (mode=="dia") {
      dia[i] <- diameter(graphs[[ gnos[i] ]], directed=FALSE)
    } else if (mode=="path") {
      dia[i] <- mean_distance(graphs[[ gnos[i] ]], directed=FALSE)
    }
    isconn[i] <- is_connected(graphs[[ gnos[i] ]])
  }

  value <- data.frame( gnos, isconn, dia)
  if (mode=="dia") {
    title <- "Diameter"
    colnames(value) <- c("Graph #", "Connected", "Diameter")
  } else if (mode=="path") {
    title <- "Average path length"
    colnames(value) <- c("Graph #", "Connected", "Mean path length")  }
  title <- paste(title, "of graph")
  if (length(gnos) > 1) {
    title <- paste(sep="", title, "s")
  }
  .tkigraph.showData(value, title=title)
  
}

.tkigraph.plot.diameter <- function(simple=FALSE) {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }

  graph <- get("graphs", .tkigraph.env)[[gnos]]
  edges <- E(graph, path=get_diameter(graph, directed=FALSE), directed=FALSE)
  color <- rep("black", ecount(graph))
  color[edges] <- "red"
  width <- rep(1, ecount(graph))
  width[edges] <- 2
  .tkigraph.plot(gnos=gnos, simple=simple, edge.color=color, edge.width=width)
}

.tkigraph.clusters <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  comm <- components(graph)
  members <- sapply(sapply(seq(along=comm$csize),
                           function(i) which(comm$membership==i)),
                    paste, collapse=", ")
  value <- data.frame("Component"=seq(along=comm$csize), "Members"=members)
  .tkigraph.showData(value, title=paste("Components of graph #",
                       gnos), right=FALSE)
}

.tkigraph.clusters.membership <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  comm <- components(graph)
  value <- data.frame("Vertex"=seq(along=comm$membership),
                 "Component"=comm$membership)
  .tkigraph.showData(value, title=paste("Components of graph #", gnos))
}

#' @importFrom graphics hist plot
#' @importFrom grDevices dev.new

.tkigraph.calculate.clusters <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  cs <- components(graph)$csize
  value <- data.frame(seq(along=cs), cs)
  colnames(value) <- c("Cluster #", "Size")

  plot.command <- function() {
    read <- .tkigraph.dialogbox(TITLE="Plot degree distribution",
                                logx=list(name="Logarithmic `X' axis",
                                  type="boolean", default="FALSE"),
                                logy=list(name="Logarithmic `Y' axis",
                                  type="boolean", default="FALSE"),
                                hist=list(name="Histogram",
                                  type="boolean", default="FALSE"))

    if (!read$hist) {
      h <- hist(value[,2], 0:max(value[,2]), plot=FALSE)$density  
      log <- ""
      if (read$logx) { log <- paste(sep="", log, "x") }
      if (read$logy) { log <- paste(sep="", log, "y") }
      dev.new()
      plot(1:max(value[,2]), h, xlab="Component size",
           ylab="Relative frequency",
           type="b", main="Component size distribution", log=log)
    } else {
      dev.new()
      hist(value[,2], main="Component size distribution", xlab="Degree")
    }
  }
  value <- value[ order(value[,2], decreasing=TRUE), ]
  mv <- paste("Mean component size:", round(mean(cs),2))
  .tkigraph.showData(value,
                     title=paste(sep="", "Component sizes, graph #", gnos),
                     plot.text="Plot distribution",
                     plot.command=plot.command, showmean=mv)
}

#' @importFrom grDevices rainbow

.tkigraph.plot.comp <- function(simple=FALSE) {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  clu <- components(graph)
  colbar <- rainbow(length(clu$csize)*2)
  vertex.color <- colbar[ clu$membership ]
  .tkigraph.plot(gnos=gnos, simple=simple, vertex.color=vertex.color)
}

.tkigraph.create.giantcomp <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  clu <- components(graph)
  v <- which(clu$membership == which.max(clu$csize))
  g <- induced_subgraph(graph, v)
  .tkigraph.add.graph(g)
}

.tkigraph.create.mycomp <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  read <- .tkigraph.dialogbox(TITLE="Component of a vertex",
                              vertex=list(name="Vertex", type="numeric",
                                default=1, min=1, max=vcount(graph)))
  if (read$vertex<1 || read$vertex >vcount(graph)) {
    .tkigraph.error("Invalid vertex id")
    return()
  }

  g <- induced_subgraph(graph, subcomponent(graph, read$vertex))
  .tkigraph.add.graph(g)
}

.tkigraph.create.comp <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]
  read <- .tkigraph.dialogbox(TITLE="Graph from component",
                              comp=list(name="Component id", type="numeric",
                                default=1, min=1))
  clu <- components(graph)
  if (read$comp<1 || read$comp > length(clu$csize)) {
    .tkigraph.error("Invalid component id")
    return()
  }
  
  v <- which(clu$membership==read$comp)
  g <- induced_subgraph(graph, v)
  .tkigraph.add.graph(g)  
}

#' @importFrom grDevices dev.new
#' @importFrom graphics layout layout.show par plot text

.tkigraph.motifs.draw <- function() {
  read <- .tkigraph.dialogbox(TITLE="Draw all motifs",
                              size=list(name="Size", type="numeric",
                                default=3, min=3, max=4),
                              directed=list(name="Directed", type="boolean",
                                default="FALSE"))

  if (read$size < 3 || read$size > 4) {
    .tkigraph.error("Invalid motif size, should be 3 or 4")
    return()
  }

  if (read$size == 3) {
    co <- matrix( c(1,1, 0,0, 2,0), ncol=2, byrow=TRUE)
  } else {
    co <- matrix( c(0,1, 1,1, 0,0, 1,0), ncol=2, byrow=TRUE)
  }

  if (read$size == 3 && read$dir) {
    no <- 16
    rows <- cols <- 4
  } else if (read$size == 3 && !read$dir) {
    no <- 4
    rows <- cols <- 2
  } else if (read$size == 4 && read$dir) {
    no <- 216
    rows <- cols <- 15
  } else if (read$size == 4 && !read$dir) {
    no <- 11
    rows <- 4
    cols <- 3
  }
  names <- as.character(seq(no))
  dev.new()
  layout( matrix(1:(rows*cols), nrow=rows, byrow=TRUE) )
  layout.show(rows*cols)
  for (i in seq(no)) {
    g <- graph_from_isomorphism_class(read$size, i-1, directed=read$dir)
    par(mai=c(0,0,0,0), mar=c(0,0,0,0))
    par(cex=2)
    plot(g, layout=co, vertex.color="red", vertex.label=NA, frame=TRUE,
         edge.color="black", margin=0.1, edge.arrow.size=.5)
    text(0,0, names[i], col="blue", cex=.5)
  }
  
}

#' @importFrom grDevices dev.new
#' @importFrom graphics barplot layout layout.show par plot text

.tkigraph.motifs.find <- function() {

  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  
  read <- .tkigraph.dialogbox(TITLE="Find motifs",
                              size=list(name="Size", type="numeric",
                                default=3, min=3, max=4))
  if (read$size < 3 || read$size > 4) {
    .tkigraph.error("Invalid motif size, should be 3 or 4")
    return()
  }
  
  graphs <- get("graphs", .tkigraph.env)
  motifs <- motifs(graphs[[gnos]], size=read$size)

  if (read$size == 3) {
    co <- matrix( c(1,1, 0,0, 2,0), ncol=2, byrow=TRUE)
  } else {
    co <- matrix( c(0,1, 1,1, 0,0, 1,0), ncol=2, byrow=TRUE)
  }

  if (read$size == 3 && is_directed(graphs[[gnos]])) {
    no <- 16
    rows <- cols <- 4
  } else if (read$size == 3 && !is_directed(graphs[[gnos]])) {
    no <- 4
    rows <- cols <- 2
  } else if (read$size == 4 && is_directed(graphs[[gnos]])) {
    no <- 216
    rows <- cols <- 15
  } else if (read$size == 4 && !is_directed(graphs[[gnos]])) {
    no <- 11
    rows <- 4
    cols <- 3
  }

  dev.new()
  barplot(motifs, names.arg=seq(no))
  
  names <- as.character(seq(no))
  dev.new()
  layout( matrix(1:(rows*cols), nrow=rows, byrow=TRUE) )
  layout.show(rows*cols)
  for (i in seq(no)) {
    g <- graph_from_isomorphism_class(read$size, i-1,
                         directed=is_directed(graphs[[gnos]]))
    par(mai=c(0,0,0,0), mar=c(0,0,0,0))
    par(cex=2)
    plot(g, layout=co, vertex.color="red", vertex.label=NA, frame=TRUE,
         edge.color="black", margin=0.1)
    text(0,0, motifs[i], col="green")
  }  
  
}

.tkigraph.spinglass <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]

  if (!is_connected(graph)) {
    .tkigraph.error("Graph is not connected")
    return()
  }

  weights <- if ("weight" %in% edge_attr_names(graph)) "TRUE" else "FALSE"
  read <- .tkigraph.dialogbox(TITLE="Spinglass community structure",
                              gamma=list(name="Gamma parameter",
                                type="numeric", default=1),
                              weights=list(name="Use edge weights",
                                type="boolean", default=weights),
                              spins=list(name="Number of spins",
                                type="numeric", default=25),
                              parupdate=list(name="Parallel update",
                                type="boolean", default="FALSE"),
                              update.rule=list(name="Update rule",
                                type="listbox", default="1",
                                values=c("Simple", "Configuration model")),
                              start.temp=list(name="Start temperature",
                                type="numeric", default=1),
                              stop.temp=list(name="Stop temperature",
                                type="numeric", default=0.1),
                              cool.fact=list(name="Cooling factor",
                                type="numeric", default=0.99))

  read$update.rule <- c("simple", "config")[read$update.rule+1]
  if (read$weights) {
    if (!"weight" %in% edge_attr_names(graph)) {
      .tkigraph.warning("This graphs is not weighted")
      read$weights <- NULL
    } else {
      read$weights <- E(graph)$weight
    }
  } else {
    read$weights <- NULL
  }
  comm <- cluster_spinglass(graph, weights=read$weights, spins=read$spins,
                              parupdate=read$parupdate, start.temp=read$start.temp,
                              stop.temp=read$stop.temp, cool.fact=read$cool.fact,
                              update.rule=read$update.rule, gamma=read$gamma)

  .tkigraph.spinglass.community.dialog(comm, read, gnos)
}

#' @importFrom grDevices rainbow

.tkigraph.spinglass.community.dialog <- function(comm, read, gnos) {
  dialog <- tcltk::tktoplevel()
  frame <- tcltk::tkframe(dialog)
  tcltk::tkgrid(frame)
  tcltk::tktitle(dialog) <- "Spinglass community structure algorithm results"

  read$update.rule <- if (read$update.rule=="simple") "Simple" else "Configuration model"
  tcltk::tkgrid(tcltk::tklabel(dialog, text="Spinglass community structure algorithm results",
                 font=tcltk::tkfont.create(family="times", size=16, weight="bold")),
         columnspan=3, sticky="nsew", "in"=frame, padx=10, pady=10)
  tcltk::tkgrid(txt <- tcltk::tktext(dialog), columnspan=1, rowspan=5, sticky="nsew",
         "in"=frame, padx=10, pady=10)
  tcltk::tkconfigure(txt, height=15)
  tcltk::tkinsert(txt, "end", "Parameters were:\n")
  tcltk::tkinsert(txt, "end", paste("  Gamma=", read$gamma, "\n"))
  tcltk::tkinsert(txt, "end", if (is.null(read$weights)) "  Weights were not used.\n" else
           "  Weights were used.\n")
  tcltk::tkinsert(txt, "end", paste("  Number of spins=", read$spins, "\n"))
  tcltk::tkinsert(txt, "end", if (read$parupdate) "  Parallel updating.\n" else
           "  Sequential updating.\n")
  tcltk::tkinsert(txt, "end", paste("  Update rule:", read$update.rule, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Start temperature was", read$start.temp, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Stop temperaure was", read$stop.temp, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Cooling factor was", read$cool.fact, "\n"))

  tcltk::tkinsert(txt, "end", "\nResults:\n")
  tcltk::tkinsert(txt, "end", paste("  Number of communities found:", length(comm$csize),
                             "\n"))
  tcltk::tkinsert(txt, "end", paste("  Modularity of the result:", comm$modularity, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Stopped at temperature:", comm$temperature, "\n"))
  tcltk::tkconfigure(txt, state="disabled")

  show.communities <- function() {
    members <- sapply(sapply(seq(along=comm$csize),
                             function(i) which(comm$membership==i)),
                      paste, collapse=", ")
    value <- data.frame("Community"=seq(along=comm$csize), "Members"=members)
    .tkigraph.showData(value,
                       title=paste("Communities, spinglass algorithm on graph #",
                         gnos), right=FALSE)
  }
  show.membership <- function() {
    value <- data.frame("Vertex"=seq(along=comm$membership),
                   "Community"=comm$membership)
    .tkigraph.showData(value,
                       title=paste("Communities, spinglass algorithm on graph #",
                         gnos))
  }
  show.csize <- function() {
    value <- data.frame("Comm. #"=seq(along=comm$csize), "Size"=comm$csize)
    value <- value[ order(value[,2], decreasing=TRUE), ]
    .tkigraph.showData(value,
                       title=paste("Communities, spinglass algorithm on graph #",
                         gnos))                       
  }
  plot.communities <- function(simple=FALSE) {
    colbar <- rainbow(length(comm$csize)*2)
    vertex.color=colbar[ comm$membership ]
    .tkigraph.plot(gnos=gnos, simple=simple, vertex.color=vertex.color)
  }
  create.subgraph <- function() {
    ## TODO
  }
  
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Show communities", command=show.communities),
         "in"=frame, sticky="ew", column=1, row=1, padx=10, pady=10)
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Show membership", command=show.membership),
         "in"=frame, sticky="ew", column=1, row=2, padx=10, pady=10)
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Show community sizes", command=show.csize),
         "in"=frame, sticky="ew", column=1, row=3, padx=10, pady=10)
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Draw communities",
                  command=function() plot.communities(simple=FALSE)),
         "in"=frame, sticky="ew", column=1, row=4, padx=10, pady=10)
##   tcltk::tkgrid(tcltk::tkbutton(dialog, text="Create subgraph", command=create.subgraph),
##          "in"=frame, sticky="nsew", column=1, row=6, padx=10, pady=10)
  
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Close", command=function() tcltk::tkdestroy(dialog)),
         "in"=frame, sticky="nsew", columnspan=2, padx=10, pady=10)
}

.tkigraph.my.spinglass <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos)!=1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graph <- get("graphs", .tkigraph.env)[[gnos]]

  if (!is_connected(graph)) {
    .tkigraph.error("Graph is not connected")
    return()
  }

  weights <- if ("weight" %in% edge_attr_names(graph)) "TRUE" else "FALSE"
  read <- .tkigraph.dialogbox(TITLE="Spinglass community of a vertex",
                              vertex=list(name="Vertex", type="numeric",
                                default=1, min=1, max=vcount(graph)),
                              gamma=list(name="Gamma parameter",
                                type="numeric", default=1),
                              weights=list(name="Use edge weights",
                                type="boolean", default=weights),
                              spins=list(name="Number of spins",
                                type="numeric", default=25),
                              update.rule=list(name="Update rule",
                                type="listbox", default="1",
                                values=c("Simple", "Configuration model")))
                              
  if (read$vertex<1 || read$vertex > vcount(graph)) {
    .tkigraph.error("Invalid vertex id")
    return()
  }
  
  read$update.rule <- c("simple", "config")[read$update.rule+1]
  if (read$weights) {
    if (!"weight" %in% edge_attr_names(graph)) {
      .tkigraph.warning("This graphs is not weighted")
      read$weights <- NULL
    } else {
      read$weights <- E(graph)$weight
    }
  } else {
    read$weights <- NULL
  }
  comm <- cluster_spinglass(graph, vertex=read$vertex,
                              weights=read$weights, spins=read$spins,
                              update.rule=read$update.rule, gamma=read$gamma)
  .tkigraph.spinglass.mycommunity.dialog(comm, read, gnos)
}

.tkigraph.spinglass.mycommunity.dialog <- function(comm, read, gnos) {
  dialog <- tcltk::tktoplevel()
  frame <- tcltk::tkframe(dialog)
  tcltk::tkgrid(frame)
  tcltk::tktitle(dialog) <- "Spinglass community of a single vertex"

  scr <- tcltk::tkscrollbar(dialog, repeatinterval=5,
                     command=function(...) tcltk::tkyview(txt,...))
  
  read$update.rule <- if (read$update.rule=="simple") "Simple" else "Configuration model"
  tcltk::tkgrid(tcltk::tklabel(dialog, text="Spinglass community of a single vertex",
                 font=tcltk::tkfont.create(family="times", size=16, weight="bold")),
         columnspan=3, sticky="nsew", "in"=frame, padx=10, pady=10)
  tcltk::tkgrid(txt <- tcltk::tktext(dialog, yscrollcommand=function(...) tcltk::tkset(scr,...)),
         columnspan=1, rowspan=3, sticky="nsew", "in"=frame, padx=10, pady=10)
  tcltk::tkconfigure(txt, height=17)
  tcltk::tkgrid(scr, row=1, column=1, rowspan=3, sticky="ns", "in"=frame, pady=10)
  tcltk::tkinsert(txt, "end", "Parameters were:\n")
  tcltk::tkinsert(txt, "end", paste("  Vertex:", read$vertex, "\n"));
  tcltk::tkinsert(txt, "end", paste("  Gamma=", read$gamma, "\n"))
  tcltk::tkinsert(txt, "end", if (is.null(read$weights)) "  Weights were not used.\n" else
           "  Weights were used.\n")
  tcltk::tkinsert(txt, "end", paste("  Number of spins=", read$spins, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Update rule:", read$update.rule, "\n"))

  tcltk::tkinsert(txt, "end", "\nResults:\n")
  tcltk::tkinsert(txt, "end", paste("  Size of the community:", length(comm$community),
                             "\n"))
  tcltk::tkinsert(txt, "end", paste("  Cohesion:", comm$cohesion, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Adhesion:", comm$adhesion, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Inner links:", comm$inner.links, "\n"))
  tcltk::tkinsert(txt, "end", paste("  Outer links:", comm$outer.links, "\n"))

  tcltk::tkinsert(txt, "end", "\nThe community:\n")
  con <- textConnection(NULL, open="w", local=TRUE)
  cat(sort(comm$community), file=con, fill=TRUE, sep=", ")
  tcltk::tkinsert(txt, "end", textConnectionValue(con))
  close(con)
  tcltk::tkconfigure(txt, state="disabled")

  plot.communities <- function(simple=FALSE) {
    graph <- get("graphs", .tkigraph.env)[[gnos]]
    color <- rep("skyblue2", vcount(graph))
    color[ comm$community ] <- "red"
    .tkigraph.plot(gnos=gnos, simple=simple, vertex.color=color)
  }
  
  create.graph <- function() {
    graph <- get("graphs", .tkigraph.env)[[gnos]]
    g <- induced_subgraph(graph, comm$community)
    .tkigraph.add.graph(g)
  }
  
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Draw community",
                  command=function() plot.communities(simple=FALSE)),
         "in"=frame, sticky="ew", column=2, row=1, padx=10, pady=10)  
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Create graph from community",
                  command=create.graph),
         "in"=frame, sticky="ew", column=2, row=2, padx=10, pady=10)         
  
  tcltk::tkgrid(tcltk::tkbutton(dialog, text="Close", command=function() tcltk::tkdestroy(dialog)),
         "in"=frame, sticky="nsew", columnspan=3, padx=10, pady=10)  
}

.tkigraph.cohesion <- function() {
  gnos <- .tkigraph.get.selected()
  if (length(gnos) != 1) {
    .tkigraph.error("Please select exactly one graph")
    return()
  }
  graphs <- decompose(get("graphs", .tkigraph.env)[[gnos]])
  coh <- sapply(graphs, cohesion)
  value <- data.frame("Component"=seq(length=length(graphs)), "Cohesion"=coh)
  .tkigraph.showData(value, title=paste("Cohesion of components in graph #",
                              gnos), right=FALSE)
}  

#' @importFrom utils browseURL

.tkigraph.help <- function(page="index.html") {
  dialog <- tcltk::tktoplevel()
  tcltk::tktitle(dialog) <- "Help (main page)"

  close <- function() {
    tcltk::tkdestroy(dialog)
  }

  scr <- tcltk::tkscrollbar(dialog, repeatinterval=5,
                     command=function(...) tcltk::tkyview(txt,...))
  txt <- tcltk::tktext(dialog, yscrollcommand=function(...) tcltk::tkset(scr, ...),
                width=80, height=40)

  main.menu <- tcltk::tkmenu(dialog)
  tcltk::tkadd(main.menu, "command", label="Back", command=function() {
    tcltk::tcl("render_back", txt)
  })
  tcltk::tkadd(main.menu, "command", label="Forw", command=function() {
    tcltk::tcl("render_forw", txt)
  })
  tcltk::tkadd(main.menu, "command", label="Home", command=function() {
    tcltk::tcl("render", txt, "index.html"); return()
  })
  tcltk::tkadd(main.menu, "command", label="Close", command=function() {
    tcltk::tkdestroy(dialog); return()
  })
  tcltk::tkconfigure(dialog, "-menu", main.menu)
  
  tcltk::tkpack(scr, side="right", fill="y", expand=0)
  tcltk::tkpack(txt, side="left", fill="both", expand=1)

  browser.button <- tcltk::tkbutton(dialog, command=function() {
    browseURL(tcltk::tclvalue("browser_url"))
  })
  
  tcltk::tcl("global", "tkigraph_help_root", "tkigraph_help_history",
      "tkigraph_help_history_pos", "browser_button", "browser_url")  
  tcltk::tcl("set", "tkigraph_help_root",
      system.file("tkigraph_help", package="igraph"))
  tcltk::tcl("set", "browser_button", browser.button)
  
  tcltk::tcl("source", system.file("html_library.tcl", package="igraph"))
  tcltk::tcl("source", system.file("my_html_library.tcl", package="igraph"))
  tcltk::tcl("HMinit_win", txt)
  tcltk::tcl("start_history", txt)
  tcltk::tcl("render", txt, "index.html")
  
  tcltk::tkconfigure(txt, state="disabled")
}

#' @importFrom utils browseURL

.tkigraph.help.external <- function(page="index.html") {
  f <- system.file("tkigraph_help/index.html", package="igraph")
  browseURL(f)
}

#' @importFrom utils packageDescription

.tkigraph.about <- function() {
  dialog <- tcltk::tktoplevel()
  tcltk::tktitle(dialog) <- "About tkigraph"
  image <- tcltk::tkimage.create("photo", "img", format="gif",
                         file=system.file("igraph.gif", package="igraph"))
  logo <- tcltk::tklabel(dialog, relief="flat", padx=10, pady=10, image=image)
  label <- tcltk::tklabel(dialog, padx=30, pady=10,
                   text=paste(sep="", "tkigraph (c) 2009 Gabor Csardi\n",
                     "igraph (c) 2003-2009 Gabor Csardi and Tamas Nepusz\n\n",
                     "This is igraph version ",
                     packageDescription("igraph")$Version, " and\n",
                     R.version$version.string))
  close <- tcltk::tkbutton(dialog, text="Close", command=function() {
    tcltk::tkdestroy(dialog); return()
  })

  tcltk::tkpack(logo, side="top", anchor="c", expand=0)
  tcltk::tkpack(label, side="top", anchor="c", expand=0)
  tcltk::tkpack(close, side="bottom", anchor="c", expand=0)
}

#####################################################
# This is from the 'relimp' package by David Firth, thanks

#' @importFrom utils write.table

.tkigraph.showData <-
    function (dataframe,
              colname.bgcolor = "grey50",
              rowname.bgcolor = "grey50",
              body.bgcolor = "white",
              colname.textcolor = "white",
              rowname.textcolor = "white",
              body.textcolor = "black",
              font = "Courier 12",
              maxheight = 30,
              maxwidth = 80,
              title = NULL,
              rowname.bar = "left",
              colname.bar = "top",
              rownumbers = FALSE,
              placement = "-20-40",
              plot.text="Plot",
              plot.command=NULL,
              suppress.X11.warnings = FALSE,
              right=TRUE,
              showmean=NULL,
              sort.button=TRUE,
              inthis=NULL)
{
    if (suppress.X11.warnings) { ## as in John Fox's Rcmdr package
        messages.connection <- textConnection(".messages", open = "w",
                                              local = TRUE)
        sink(messages.connection, type = "message")
        on.exit({
            sink(type="message")
            close(messages.connection)
        })
    }
    object.name <- deparse(substitute(dataframe))
    if (!is.data.frame(dataframe)){
        temp <- try(dataframe <- as.data.frame(dataframe), silent = FALSE)
        if (inherits(temp, "try-error")) {
            stop(paste(object.name, "cannot be coerced to a data frame"))
        }
        object.name <- paste("as.data.frame(", object.name, ")", sep = "")
    }

    if (is.numeric(rownumbers) &&
        length(rownumbers) != nrow(dataframe))
        stop("rownumbers argument must be TRUE, FALSE or have length nrow(dataframe)")
    oldwidth <- unlist(options("width"))
    options(width = 10000)
    conn <- textConnection(NULL, open="w", local=TRUE)
    sink(conn)
    options(max.print=10000000)
    print(dataframe, right=right)
    sink()
    zz <- strsplit(textConnectionValue(conn), "\n", fixed=TRUE)
    close(conn)
    if (length(zz) > 1 + nrow(dataframe)) stop(
       "data frame too wide")
    options(width = oldwidth)
    if (is.null(inthis)) {
      base <- tcltk::tktoplevel()
      tcltk::tkwm.geometry(base, placement)
      tcltk::tkwm.title(base, {
        if (is.null(title))
          object.name
        else title
      })
    } else { base <- inthis }      
    nrows <- length(zz) - 1
    if (is.numeric(rownumbers))
        rowname.text <- paste(rownumbers, row.names(dataframe))
    else if (rownumbers)
        rowname.text <- paste(1:nrows, row.names(dataframe))
    else rowname.text <- row.names(dataframe)
    namewidth = max(nchar(rowname.text))
    yy <- substring(zz, 2 + max(nchar(row.names(dataframe))))
    datawidth <- max(nchar(yy))
    winwidth <- min(1 + datawidth, maxwidth)
    hdr <- tcltk::tktext(base,
                  bg = colname.bgcolor,
                  fg = colname.textcolor,
                  font = font,
                  height = 1,
                  width = winwidth,
                  takefocus = TRUE)
    ftr <- tcltk::tktext(base,
                  bg = colname.bgcolor,
                  fg = colname.textcolor,
                  font = font,
                  height = 1,
                  width = winwidth,
                  takefocus = TRUE)
    textheight <- min(maxheight, nrows)
    txt <- tcltk::tktext(base,
                  bg = body.bgcolor,
                  fg = body.textcolor,
                  font = font,
                  height = textheight,
                  width = winwidth,
                  setgrid = 1,
                  takefocus = TRUE)
     lnames <- tcltk::tktext(base,
                     bg = rowname.bgcolor,
                     fg = rowname.textcolor,
                     font = font,
                     height = textheight,
                     width = namewidth,
                     takefocus = TRUE)
    rnames <- tcltk::tktext(base,
                     bg = rowname.bgcolor,
                     fg = rowname.textcolor,
                     font = font,
                     height = textheight,
                     width = namewidth,
                     takefocus = TRUE)
    xscroll <- tcltk::tkscrollbar(base,
                           orient = "horizontal",
                           repeatinterval = 1,
                           command = function(...) {
                               tcltk::tkxview(txt, ...)
                               tcltk::tkxview(hdr, ...)
                               tcltk::tkxview(ftr, ...)
                           })
    string.to.vector <- function(string.of.indices) {
        string.of.indices <- tcltk::tclvalue(string.of.indices)
        as.numeric(strsplit(string.of.indices, split = " ")[[1]])
    }
    tcltk::tkconfigure(txt, xscrollcommand = function(...) {
        tcltk::tkset(xscroll, ...)
        xy <- string.to.vector(tcltk::tkget(xscroll))
        tcltk::tkxview.moveto(hdr, xy[1])
        tcltk::tkxview.moveto(ftr, xy[1])
    })
    tcltk::tkconfigure(hdr, xscrollcommand = function(...) {
        tcltk::tkset(xscroll, ...)
        xy <- string.to.vector(tcltk::tkget(xscroll))
        tcltk::tkxview.moveto(txt, xy[1])
        tcltk::tkxview.moveto(ftr, xy[1])
    })
    tcltk::tkconfigure(ftr, xscrollcommand = function(...) {
        tcltk::tkset(xscroll, ...)
        xy <- string.to.vector(tcltk::tkget(xscroll))
        tcltk::tkxview.moveto(hdr, xy[1])
        tcltk::tkxview.moveto(txt, xy[1])
    })
    yscroll <- tcltk::tkscrollbar(base,
                           orient = "vertical",
                           repeatinterval = 1,
                           command = function(...) {
                               tcltk::tkyview(txt, ...)
                               tcltk::tkyview(lnames, ...)
                               tcltk::tkyview(rnames, ...)
                           })
    tcltk::tkconfigure(txt, yscrollcommand = function(...) {
        tcltk::tkset(yscroll, ...)
        xy <- string.to.vector(tcltk::tkget(yscroll))
        tcltk::tkyview.moveto(lnames, xy[1])
        tcltk::tkyview.moveto(rnames, xy[1])
    })
    tcltk::tkconfigure(lnames, yscrollcommand = function(...) {
        tcltk::tkset(yscroll, ...)
        xy <- string.to.vector(tcltk::tkget(yscroll))
        tcltk::tkyview.moveto(txt, xy[1])
        tcltk::tkyview.moveto(rnames, xy[1])
    })
    tcltk::tkconfigure(rnames, yscrollcommand = function(...) {
        tcltk::tkset(yscroll, ...)
        xy <- string.to.vector(tcltk::tkget(yscroll))
        tcltk::tkyview.moveto(txt, xy[1])
        tcltk::tkyview.moveto(lnames, xy[1])
    })
    tcltk::tkbind(txt, "<B2-Motion>", function(x, y) {
        tcltk::tkscan.dragto(txt, x, y)
    })
## The next block just enables copying from the text boxes
{
    copyText.hdr <- function(){
        tcltk::tcl("event", "generate",
                   tcltk::.Tk.ID(hdr),
              "<<Copy>>")}
    tcltk::tkbind(hdr, "<Button-1>", function() tcltk::tkfocus(hdr))
    editPopupMenu.hdr <- tcltk::tkmenu(hdr, tearoff = FALSE)
    tcltk::tkadd(editPopupMenu.hdr, "command", label = "Copy <Ctrl-C>",
              command = copyText.hdr)
    RightClick.hdr <- function(x,y) # x and y are the mouse coordinates
    {
        rootx <- as.integer(tcltk::tkwinfo("rootx", hdr))
        rooty <- as.integer(tcltk::tkwinfo("rooty", hdr))
        xTxt <- as.integer(x) + rootx
        yTxt <- as.integer(y) + rooty
        tcltk::tcl("tk_popup", editPopupMenu.hdr, xTxt, yTxt)
    }
    tcltk::tkbind(hdr, "<Button-3>", RightClick.hdr)
    tcltk::tkbind(hdr, "<Control-KeyPress-c>", copyText.hdr)
    ##
    copyText.ftr <- function(){
        tcltk::tcl("event", "generate",
              tcltk::.Tk.ID(ftr),
              "<<Copy>>")}
    tcltk::tkbind(ftr, "<Button-1>", function() tcltk::tkfocus(ftr))
    editPopupMenu.ftr <- tcltk::tkmenu(ftr, tearoff = FALSE)
    tcltk::tkadd(editPopupMenu.ftr, "command", label = "Copy <Ctrl-C>",
              command = copyText.ftr)
    RightClick.ftr <- function(x,y) # x and y are the mouse coordinates
    {
        rootx <- as.integer(tcltk::tkwinfo("rootx", ftr))
        rooty <- as.integer(tcltk::tkwinfo("rooty", ftr))
        xTxt <- as.integer(x) + rootx
        yTxt <- as.integer(y) + rooty
        tcltk::tcl("tk_popup", editPopupMenu.ftr, xTxt, yTxt)
    }
    tcltk::tkbind(ftr, "<Button-3>", RightClick.ftr)
    tcltk::tkbind(ftr, "<Control-KeyPress-c>", copyText.ftr)
    ##
    copyText.txt <- function(){
        tcltk::tcl("event", "generate",
              tcltk::.Tk.ID(txt),
              "<<Copy>>")}
    tcltk::tkbind(txt, "<Button-1>", function() tcltk::tkfocus(txt))
    editPopupMenu.txt <- tcltk::tkmenu(txt, tearoff = FALSE)
    tcltk::tkadd(editPopupMenu.txt, "command", label = "Copy <Ctrl-C>",
              command = copyText.txt)
    RightClick.txt <- function(x,y) # x and y are the mouse coordinates
    {
        rootx <- as.integer(tcltk::tkwinfo("rootx", txt))
        rooty <- as.integer(tcltk::tkwinfo("rooty", txt))
        xTxt <- as.integer(x) + rootx
        yTxt <- as.integer(y) + rooty
        tcltk::tcl("tk_popup", editPopupMenu.txt, xTxt, yTxt)
    }
    tcltk::tkbind(txt, "<Button-3>", RightClick.txt)
    tcltk::tkbind(txt, "<Control-KeyPress-c>", copyText.txt)
    ##
    copyText.lnames <- function(){
        tcltk::tcl("event", "generate",
              tcltk::.Tk.ID(lnames),
              "<<Copy>>")}
    tcltk::tkbind(lnames, "<Button-1>", function() tcltk::tkfocus(lnames))
    editPopupMenu.lnames <- tcltk::tkmenu(lnames, tearoff = FALSE)
    tcltk::tkadd(editPopupMenu.lnames, "command", label = "Copy <Ctrl-C>",
              command = copyText.lnames)
    RightClick.lnames <- function(x,y) # x and y are the mouse coordinates
    {
        rootx <- as.integer(tcltk::tkwinfo("rootx", lnames))
        rooty <- as.integer(tcltk::tkwinfo("rooty", lnames))
        xTxt <- as.integer(x) + rootx
        yTxt <- as.integer(y) + rooty
        tcltk::tcl("tk_popup", editPopupMenu.lnames, xTxt, yTxt)
    }
    tcltk::tkbind(lnames, "<Button-3>", RightClick.lnames)
    tcltk::tkbind(lnames, "<Control-KeyPress-c>", copyText.lnames)
    ##
        copyText.rnames <- function(){
        tcltk::tcl("event", "generate",
              tcltk::.Tk.ID(rnames),
              "<<Copy>>")}
    tcltk::tkbind(rnames, "<Button-1>", function() tcltk::tkfocus(rnames))
    editPopupMenu.rnames <- tcltk::tkmenu(rnames, tearoff = FALSE)
    tcltk::tkadd(editPopupMenu.rnames, "command", label = "Copy <Ctrl-C>",
              command = copyText.rnames)
    RightClick.rnames <- function(x,y) # x and y are the mouse coordinates
    {
        rootx <- as.integer(tcltk::tkwinfo("rootx", rnames))
        rooty <- as.integer(tcltk::tkwinfo("rooty", rnames))
        xTxt <- as.integer(x) + rootx
        yTxt <- as.integer(y) + rooty
        tcltk::tcl("tk_popup", editPopupMenu.rnames, xTxt, yTxt)
    }
    tcltk::tkbind(rnames, "<Button-3>", RightClick.rnames)
    tcltk::tkbind(rnames, "<Control-KeyPress-c>", copyText.rnames)
}

    tcltk::tktag.configure(hdr, "notwrapped", wrap = "none")
    tcltk::tktag.configure(ftr, "notwrapped", wrap = "none")
    tcltk::tktag.configure(txt, "notwrapped", wrap = "none")
    tcltk::tktag.configure(lnames, "notwrapped", wrap = "none")
    tcltk::tktag.configure(rnames, "notwrapped", wrap = "none")
    tcltk::tkinsert(txt, "end", paste(paste(yy[-1], collapse = "\n"),
                               sep = ""), "notwrapped")

    tcltk::tkgrid(txt, row = 1, column = 1, sticky = "nsew")
    if ("top" %in% colname.bar) {
        tcltk::tkinsert(hdr, "end", paste(yy[1], sep = ""), "notwrapped")
        tcltk::tkgrid(hdr, row = 0, column = 1, sticky = "ew")
    }
    if ("bottom" %in% colname.bar) {
        tcltk::tkinsert(ftr, "end", paste(yy[1], sep = ""), "notwrapped")
        tcltk::tkgrid(ftr, row = 2, column = 1, sticky = "ew")
    }
    if ("left" %in% rowname.bar) {
        tcltk::tkinsert(lnames, "end",
                 paste(rowname.text, collapse = "\n"),
                 "notwrapped")
        tcltk::tkgrid(lnames, row = 1, column = 0, sticky = "ns")
    }
    if ("right" %in% rowname.bar) {
        tcltk::tkinsert(rnames, "end",
                 paste(rowname.text, collapse = "\n"),
                 "notwrapped")
        tcltk::tkgrid(rnames, row = 1, column = 2, sticky = "ns")
    }
    tcltk::tkconfigure(hdr, state = "disabled")
    tcltk::tkconfigure(ftr, state = "disabled")
    tcltk::tkconfigure(txt, state = "disabled")
    tcltk::tkconfigure(lnames, state = "disabled")
    tcltk::tkconfigure(rnames, state = "disabled")
    if (maxheight < nrows) {
        tcltk::tkgrid(yscroll, row = 1, column = 3, sticky = "ns")
    }
    if (maxwidth < datawidth) {
        tcltk::tkgrid(xscroll, row = 3, column = 1, sticky = "ew")
    }

    sortColumn <- function(n, decreasing=FALSE) {
      dataframe <<- dataframe[ order(dataframe[[n]], decreasing=decreasing), ]
      rownames(dataframe) <- seq(length=nrow(dataframe))
      .tkigraph.showData(dataframe,
                         colname.bgcolor = colname.bgcolor,
                         rowname.bgcolor = rowname.bgcolor,
                         body.bgcolor = body.bgcolor,
                         colname.textcolor = colname.textcolor,
                         rowname.textcolor = rowname.textcolor,
                         body.textcolor = body.textcolor,
                         font = font,
                         maxheight = maxheight,
                         maxwidth = maxwidth,
                         title = title,
                         rowname.bar = rowname.bar,
                         colname.bar = colname.bar,
                         rownumbers = rownumbers,
                         placement = placement,
                         plot.text=plot.text,
                         plot.command=plot.command,
                         suppress.X11.warnings = suppress.X11.warnings,
                         right=right,
                         showmean=showmean,
                         sort.button=sort.button,
                         inthis=base)
    }

    pf <- tcltk::tkframe(base)
    if (is.null(inthis)) { tcltk::tkgrid(pf, column=5, row=0, rowspan=10, sticky="new") }

    if (!is.null(showmean) && is.null(inthis)) {
      for (i in seq(along=showmean)) {
        tcltk::tkgrid(tcltk::tklabel(base, text=showmean[1]), sticky="nsew",
               column=0, padx=1, pady=1, columnspan=4)
      }
    }

    sortBut <- tcltk::tkbutton(base, text="Sort otherwise", command=function() {})

    sortPopup <- function() {
      sortMenu <- tcltk::tkmenu(base, tearoff=FALSE)
      sapply(seq(along=colnames(dataframe)),
             function(n) {
               tcltk::tkadd(sortMenu, "command", label=colnames(dataframe)[n],
                     command=function() sortColumn(colnames(dataframe)[n]))
               label <- paste(colnames(dataframe)[n], "decreasing", sep=", ")
               tcltk::tkadd(sortMenu, "command", label=label,
                     command=function() sortColumn(colnames(dataframe)[n],
                       decreasing=TRUE))
             })
      rootx <- as.integer(tcltk::tkwinfo("rootx", sortBut))
      rooty <- as.integer(tcltk::tkwinfo("rooty", sortBut))
      tcltk::tkpopup(sortMenu, rootx, rooty)
    }

    if (!is.null(plot.command)) {
      but <- tcltk::tkbutton(base, text=plot.text, command=plot.command)
      tcltk::tkgrid(but, "in"=pf, sticky="ew", column=10, row=1, padx=1, pady=1)
    }

    if (sort.button) { tcltk::tkgrid(sortBut, "in"=pf, sticky="ew", column=10, row=2,
                              padx=1, pady=1) }
    tcltk::tkconfigure(sortBut, command=sortPopup)

    savebut <- tcltk::tkbutton(base, text="Export table to file", command=function() {
      filename <- tcltk::tkgetSaveFile(initialfile="data.txt",
                                defaultextension="txt",
                                title="Export as table")
      filename <- paste(as.character(filename), collapse=" ")
      write.table(dataframe, file=filename, row.names=FALSE, col.names=FALSE)
    })
    tcltk::tkgrid(savebut, "in"=pf, sticky="ew", column=10, row=3, padx=1, pady=1)

    but <- tcltk::tkbutton(base, text="Close", command=function() tcltk::tkdestroy(base))
    tcltk::tkgrid(but, "in"=pf, sticky="ew", column=10, row=4, padx=1, pady=1) 
    tcltk::tkgrid.columnconfigure(pf, 0, weight=1)

    tcltk::tkgrid.rowconfigure(base, 1, weight = 1)
    tcltk::tkgrid.columnconfigure(base, 1, weight = 1)
    tcltk::tkwm.maxsize(base, 2 + datawidth, nrows)
    tcltk::tkwm.minsize(base, 2 + nchar(names(dataframe)[1]), 1)
invisible(NULL)
}

.tkigraph.net.moody.white <-
matrix( c(0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          1,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          1,1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
          1,0,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          0,1,1,1,1,1,0,1,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,
          0,0,0,0,0,0,1,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,
          0,0,0,0,0,0,1,1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,
          0,0,0,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,
          0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1,0,0,
          0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,1,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0), nrow=23, ncol=23)


