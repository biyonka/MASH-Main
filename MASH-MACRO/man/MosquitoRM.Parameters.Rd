% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MOSQUITO-MosquitoRM-Parameters.R
\name{MosquitoRM.PARAMETERS}
\alias{MosquitoRM.PARAMETERS}
\title{MosquitoRM: Generate Parameters}
\usage{
MosquitoRM.PARAMETERS(M, f = 0.3, Q = 0.9, p = 0.9, v = 20,
  maxEIP = 30)
}
\arguments{
\item{M}{absolute mosquito density in this patch}

\item{f}{absolute mosquito blood feeding rate (1/f is average time between bloodmeals)}

\item{Q}{human blood index, the proportion of bloodmeals taken on humans}

\item{v}{number of eggs laid per mosquito per egg batch}

\item{maxEIP}{the maximum length of the EIP if accounting for time/temperature-dependent EIP}
}
\description{
Generate a named list of parameters for \code{\link{MosquitoRM}}.
}
