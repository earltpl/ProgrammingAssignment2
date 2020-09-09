## Put comments here that give an overall description of what your
## functions do

## This functions create and calculate an inverted matrix, similar to what we get
## using solve(x)

makeCacheMatrix <- function(x = matrix()) {
  em <- NULL
  set <- function(y) {
    x <<- y
    em <<- NULL
  }
  get <- function() x
  setinv <- function(inv) em <<- inv
  getinv <- function() em
  list(set = set, get = get,
       getinv = getinv,
       setinv = setinv)
  
}


## My above function creates a matrix given specified values, get the values of the matrix
## Set the value for the inverse matrix and get the value for this inverse matrix.  


cacheSolve <- function(x, ...) {
  em <- x$getinv()
  if(!is.null(em)) {
    message("getting cached data")
    return(em)
  }
  data <- x$get()
  em <- solve(data, ...)
  x$setinv(em)
  em    ## Return a matrix that is the inverse of 'x'
}

## Our second function caches the calculated results  if it hasn't been calculated 
## previously
