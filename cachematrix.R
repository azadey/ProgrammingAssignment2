## Methods to create a special matrix function and
## compute it's inverse of the special matrix and cache it.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    ## Inverse variable
    i <- NULL
    
    ## Method to set the matrix
    set <- function(matrix) {
        m <<- matrix
        i <<- NULL
    }
    
    ## Method get the matrix
    get <- function() m
    
    ## Method set the inverse of matrix
    setinverse <- function(inverse) i <<- inverse
    
    ## Method get the inverse of matrix
    getinverse <- function() i
    
    ## Return list of the methods
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
    
    m <- x$getinverse()
    
    ## Just return the inverse if its already set
    if( !is.null(m) ) {
        message("getting cached data")
        return(m)
    }
    
    ## Get the matrix from our object
    data <- x$get()
    
    ## Calculate the inverse using matrix multiplication
    m <- solve(data, ...)
    
    ## Set the inverse to the object
    x$setinverse(m)
    
    ## Return the matrix
    m
    
}
