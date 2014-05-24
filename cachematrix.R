###############################################################################
# Matrix inversion is usually a costly computation and their may be some
# benefit to caching the inverse of a matrix rather than compute it repeatedly.
#
# If the contents of a matrix are not changing, it may make sense to cache the
# value of the mean so that when we need it again, it can be looked up in
# the cache rather than recomputed.
###############################################################################


# makeCacheMatrix creates a special "matrix" object that can cache
# its inverse.
makeCacheMatrix <- function( x = matrix() ) {

    i <- NULL
	
    set <- function(y) {
        x <<- y
	i <<- NULL
    }
		
    get <- function() x

    # set the matrix inverse
    setInverse <- function(solve) i <<- solve

    # get the matrix inverse	
    getInverse <- function() i
	
    list( set = set,
          get = get,
          setInverse = setInverse,
          getInverse = getInverse )

}



# cacheSolvecomputes the inverse of the special "matrix" returned
# by makeCacheMatrix
cacheSolve <- function( x, ... ) {

    #
    i <- x$getInverse()

    # check/return previous matrix inverse if exists
    if( !is.null(i) ) {
        message( "getting cached data" )
        return(i)
    }

    #
    data <- x$get()

    # get matrix inverse and set so cached inverse will be used next time
    i <- solve(data, ...)
    x$setInverse(i)

    # Return a matrix that is the inverse of x
    i
			
}

