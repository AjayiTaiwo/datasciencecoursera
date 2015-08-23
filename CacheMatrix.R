makeCacheMatrix <- function(x = matrix()) {
        b <- NULL
        set <- function(y) {
                x <<- y
                b <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) b <<- solve
        getsolve <- function() b
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

cachesolve <- function(x, ...) {
        b <- x$getsolve()
        if(!is.null(b)) {
                message("getting cached data")
                return(b)
        }
        data <- x$get()
        b <- solve(data, ...)
        x$setsolve(b)
        b
}