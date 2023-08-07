## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # Initialize an empty cache to store the inverse
  inv_cache <- NULL
  
  # Setter function to set the matrix and invalidate the cache
  set <- function(matrix) {
    x <<- matrix
    inv_cache <<- NULL  # Invalidate the cache when matrix changes
  }
  
  # Getter function to retrieve the matrix
  get <- function() {
    x
  }
  
  # Function to compute and cache the inverse
  cacheInverse <- function() {
    if (!is.null(inv_cache)) {
      # If the inverse is already cached, retrieve it
      message("Retrieving cached inverse")
      return(inv_cache)
    } else {
      # Calculate the inverse and cache it
      inv <- solve(x)
      inv_cache <<- inv
      return(inv)
    }
  }
  
  # Return a list of functions
  list(set = set, get = get, cacheInverse = cacheInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  x$cacheInverse()
}

# Example usage
A <- matrix(c(2, 1, 1, 3), 2, 2)
cacheMat <- makeCacheMatrix(A)

# Compute and cache the inverse
cacheMat$cacheInverse()

# Retrieve the inverse from the cache
cacheSolve(cacheMat)
