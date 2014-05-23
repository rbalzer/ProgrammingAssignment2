# Matrix inversion is usually a costly computation and their may be some
# benefit to caching the inverse of a matrix rather than compute it repeatedly.
#
# If the contents of a matrix are not changing, it may make sense to cache the
# value of the mean so that when we need it again, it can be looked up in
# the cache rather than recomputed.


# makeCacheMatrix creates a special "matrix" object that can cache
# its inverse.
makeCacheMatrix <- function(x = matrix()) {

}



# cacheSolvecomputes the inverse of the special "matrix" returned
# by makeCacheMatrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

