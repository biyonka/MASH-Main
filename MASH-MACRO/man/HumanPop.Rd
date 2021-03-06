% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HUMAN-HumanPop-Class.R
\docType{class}
\name{HumanPop}
\alias{HumanPop}
\title{HumanPop Class Definition}
\format{An \code{\link{R6Class}} generator object}
\usage{
HumanPop
}
\description{
Generate a single human population; they may live in a \code{\link{MacroPatch}} or a MicroPatch, the individual humans in the pop may move freely between patches.
Each instance of a \code{\link{Human}} lives in a \code{HumanPop}
}
\section{\strong{Constructor}}{

\itemize{
\item N: number of humans
\item patchID: integer ID of the patch this \code{HumanPop} lives in
\item houseIDs = NULL: vector of house IDs (only needed in MICRO, in MACRO human location is only resolved to the \code{\link{MacroPatch}} level)
\item bDays: vector of birthdays (given as tStart - age at start)
\item bWeights: vector of biting weights
\item tStart = 0: time to start simulation; constructor will complain if is a value other than 0
}
}

\section{\strong{Methods}}{

\itemize{
\item get_pop: see \code{\link{get_pop_HumanPop}}
\item get_human: see \code{\link{get_human_HumanPop}}
\item get_history: see \code{\link{get_history_HumanPop}}
\item simHumans: see \code{\link{simHumans_HumanPop}}
}
}

\section{\strong{Fields}}{

\itemize{
\item N: number of human
\item tStart: time to start simulation
\item pop: a object of class \code{\link[MASHcpp]{HashMap}} that stores instantiations of \code{\link{Human}}, see help for more details on the internal structure of this type.
}
}

\keyword{R6}
\keyword{class}
