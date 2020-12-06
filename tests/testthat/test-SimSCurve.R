test_that("test that S-curve simulation works. ", {
  
  # does the basic function work?
  N = 100
  sigma = 0.1
  result = SimSCurve(N, sigma)
  expect_equal(length(result$t), N)
  expect_equal(dim(result$x), c(N, 3))
  
  
  # does the basic function work when seed is set?
  N = 100
  sigma = 0.1
  result = SimSCurve(N, sigma, seed = 1)
  expect_equal(length(result$t), N)
  expect_equal(dim(result$x), c(N, 3))
  
  expect_error(SimSCurve(-1, 10)) # bad N 
  expect_error(SimSCurve("-1", 10)) # bad N 
  expect_error(SimSCurve(c(10,101), 10)) # bad N 
  expect_error(SimSCurve(109, "A")) # bad sigma
  })
