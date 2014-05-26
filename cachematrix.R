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

    # set cache to NULL
    i <- NULL
	
    #
    set <- function(y) {
        x <<- y
	i <<- NULL
    }

    # get the matrix passed in
    get <- function() x

    # set the inverse cache
    setInverse <- function(solve) i <<- solve

    # get the inverse cache
    getInverse <- function() i
	
    # a list of the makeCacheMatrix subfunctions
    list( set = set,
          get = get,
          setInverse = setInverse,
          getInverse = getInverse )

}



# cacheSolvecomputes the inverse of the special "matrix" returned
# by makeCacheMatrix
cacheSolve <- function( x, ... ) {

    # get the cache contents and assign to i
    i <- x$getInverse()

    # check/return previous matrix inverse if exists
    if( !is.null(i) ) {
        message( "getting cached data" )
        return(i)
    }

    # get the data of the matrix
    data <- x$get()

    # get matrix inverse and set so cached inverse will be used next time
    i <- solve(data, ...)
    x$setInverse(i)

    # Return a matrix that is the inverse of x
    i
			
}

