test_that("Change Point poly output is correct.", {
  N = 100
  noise = .1
  xRange = c(0,1)
  x0 = .5
  m1 = c(1,2)
  m2 = c(4,0)
  
  # does the function return the correct basic structure?
  result = SimPolyChangePoint(N, noise, xRange, x0, m1, m2)
  expect_equal(dim(result$data), c(N,2))
  expect_equal(result$x0, x0)
  expect_equal(result$data[1,1], xRange[1])
  expect_equal(result$data[N,1], xRange[2])
  
  # making sure set seed doesn't change basic behavior. 
  result = SimPolyChangePoint(N, noise, xRange, x0, m1, m2, seed = 1)
  expect_equal(dim(result$data), c(N,2))
  expect_equal(result$x0, x0)
  expect_equal(result$data[1,1], xRange[1])
  expect_equal(result$data[N,1], xRange[2])
  
  # do basics work when sigma is null?
  result = SimPolyChangePoint(N, sigma = NULL, xRange, x0, m1, m2, seed = 1)
  expect_equal(dim(result$data), c(N,2))
  
  # do basics work when x0 is null?
  result = SimPolyChangePoint(N, noise, xRange, x0 = NULL, m1, m2, seed = 1)
  expect_equal(dim(result$data), c(N,2))
  
   # do basics work when m1 and m2 are null?
  result = SimPolyChangePoint(N, noise, xRange, x0, m1 = NULL, m2 = NULL, seed = 1)
  expect_equal(dim(result$data), c(N,2))
  
  # do errors work?
  expect_error(SimPolyChangePoint(N, -1)) # negative sigma
  expect_error(SimPolyChangePoint(10.1, .1)) # not whole number N
  expect_error(SimPolyChangePoint(10, .1, m1 = c(NA, 1))) # bad coeff.
  expect_error(SimPolyChangePoint(10, .1, xRange = c(-2,-3))) # bad xRange
  expect_error(SimPolyChangePoint("A", .1)) # non numeric input
  
})

