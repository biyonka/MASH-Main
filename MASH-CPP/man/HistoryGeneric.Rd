% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppR6.R
\name{HistoryGeneric}
\alias{HistoryGeneric}
\title{Generic History}
\usage{
HistoryGeneric(N = 100)
}
\arguments{
\item{N}{reserve memory for \code{N} number of events}
}
\description{
A class for recording generic histories comprised of event times (double precision floats) and events (strings).
}
\section{Methods}{

\itemize{
\item track_history: record an event from arguments 'tEvent' (double) and 'event' (string)
\item get_history: return history as a named list
}
}

\section{Fields}{

\itemize{
\item eventT: \code{std::vector<double>}
\item events: \code{std::vector<std::string>}
}
}

