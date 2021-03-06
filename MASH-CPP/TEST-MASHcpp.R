###############################################################################
#       __  ______   _____ __  __      __________  ____
#      /  |/  /   | / ___// / / /     / ____/ __ \/ __ \
#     / /|_/ / /| | \__ \/ /_/ /_____/ /   / /_/ / /_/ /
#    / /  / / ___ |___/ / __  /_____/ /___/ ____/ ____/
#   /_/  /_/_/  |_/____/_/ /_/      \____/_/   /_/
#
#   MASH-CPP
#   Testing Ground
#   August 18, 2017
#
###############################################################################

rm(list=ls());gc()

library(MASHcpp)
library(R6)

DEBUG.MASHCPP()

class = R6Class("class", public = list(

  initialize = function(n=10) {
    private$queue = MASHcpp::HumanEventQ()
    eventT = rlnorm(n = n)
    for(i in 1:length(eventT)){
      private$queue$addEvent2Q(list(tEvent=eventT[i],tag="test",PAR=NULL))
      }
    },
  addQ = function(){
    private$queue$addEvent2Q(list(tEvent=500,tag="test",PAR=NULL))
  },
  eraseQueue = function(){
    private$queue = NULL
  },
  addQstuff = function(time){
    private$queue$addEvent2Q(list(tEvent=time,tag="test",PAR=NULL))
  },
  get_QueueN = function(){private$queue$get_queueN()},
  get_queue = function(){private$queue$get_EventQ()}
),private=list( queue = NULL))

# myClass = class$new()
# myClass$queue$get_EventQ()
# myClass$eraseQueue()
# gc()
#
# # list vs. pairlist comparison
#
# testList = function(N){
#   xx = list()
#   for(i in 1:N){
#     xx[[i]] = list(numbers=1:100)
#   }
#   rm(xx)
# }
#
# testPairList = function(N){
#   xx = pairlist()
#   for(i in 1:N){
#     xx[[i]] = list(numbers=1:100)
#   }
#   rm(xx)
# }
#
# # dataPts = NULL
# for(N in c(1e1,1e2,1e3,1e4,1e5)){
#   print(microbenchmark::microbenchmark(
#     testList(N = N),
#     testPairList(N = N),
#     times = 100
#   ))
# }


myEnv <- new.env(hash = TRUE,size = 100L)
for(i in 1:10){
assign(x = as.character(i),value = class$new(n=1),envir = myEnv)
}

eapplyTest = function(tag,...){
  eapply(env = myEnv,FUN = function(x,tag,...){
    x[[tag]](...)
  },tag=tag,...=...,all.names = TRUE,USE.NAMES = FALSE)
}

eapplyTest(tag = "addQstuff",time = 10)
eapply(myEnv,function(x){x$get_queue()},USE.NAMES = F)


microbenchmark::microbenchmark(
  # for loop; takes time to pull out the keys in R, but no memory allocation
  {
    ix = ls(envir = myEnv)
    for(i in ix){
      get(envir = myEnv,x = i)$get_QueueN()
      # myEnv[[ix]]$queue$get_queueN()
    }
  },
  # eapply: wastes time allocating memory for output and filling it, but in C
  {
    eapply(env = myEnv,FUN = function(x){x$get_QueueN()},USE.NAMES = FALSE,all.names = TRUE)
  },
  times = 200
)

microbenchmark::microbenchmark(
  # for loop; takes time to pull out the keys in R, but no memory allocation
  {
    ix = ls(envir = myEnv)
    for(i in ix){
      get(envir = myEnv,x = i)$addQ()
      # myEnv[[ix]]$queue$get_queueN()
    }
  },
  # eapply: wastes time allocating memory for output and filling it, but in C
  {
    eapply(env = myEnv,FUN = function(x){x$addQ()},USE.NAMES = FALSE,all.names = TRUE)
  },
  times = 200
)


###############################################################################
# Fixing ELPool
###############################################################################

eggs =0
larvae = 0
alpha = 0.1
gamma = 0.1
psi = 0.01
sigma = 1
oneStepTest <- function(){
  l0 = larvae
  larvae <<- eggs - (alpha + gamma + psi*(l0^sigma))*l0
  print(larvae)
}
