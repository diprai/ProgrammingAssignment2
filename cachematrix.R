## The first function creates a special "matrix" object that can cache its inverse
## The second function computes the inverse of the special matrix 
#returned by the first function


##First Function: Caching the Inverse of a matrix

#The first function contains a function that

#set the value of a matrix
#get the value of the matrix
#set the value of the inverse
#get the value of the inverse
#First function provided below:
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set,
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

#Second function: 
#The function below calculates the inverse of a matrix created with the above function.
cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if (!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}