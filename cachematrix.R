## Week 3 assignment: The pair of functions bypass the difficulty of matrix inversion by
## caching the inverse of the matrix instead of computing it repeatedly.

## The makeCacheMatrix function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
get <- function() x
setInverse <- function(inverse) inv <<- inverse
getInverse <- function() inv
list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)         
}


## The cacheSolve function will compute the inverse of the special "matrix" returned by the makeCacheMatrix 
## function. If the inverse has been calculated with no changes to the matrix, then the cacheSolve will 
## retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if (!is.null(inv)) {
        message("getting cached data")
        return(inv) 
}
data <- x$get()
inv <- solve(data, ...)
x$setInverse(inv)
inv
}
