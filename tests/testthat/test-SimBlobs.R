test_that("Sim blobs works", {
  
  # does the core package work?
  N = c(2,2,2)
  centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
  result = SimBlobs(N, centers = centers)
  expect_equal(length(result$y), sum(N))
  
  # does the core package work with seed set.
  N = c(2,2,2)
  centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
  result = SimBlobs(N, centers = centers, seed = 1)
  expect_equal(length(result$y), sum(N))
 
  # does the core package work without centers set N a vector?
  N = c(2,2,2)
  centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
  result = SimBlobs(N, seed = 1)
  expect_equal(length(result$y), sum(N))
  
  # does the core package work without centers set N a constant?
  N = 4
  centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
  result = SimBlobs(N, seed = 1)
  expect_equal(length(result$y), N * 8) # default to 8 centers.
  
  # error checks
  expect_error(SimBlobs(-1)) # bad N 
  expect_error(SimBlobs(10, -1)) # bad nFeatures 
  expect_error(SimBlobs(10, 3, -1)) # bad centers
  
  
  N = c(2,2)
  centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
  expect_error(SimBlobs(N, centers = centers)) # mismatch in number of centers and length of N. 
  expect_error(SimBlobs(10, centerBox = c(1, 0))) # bad center box. 
  
})
