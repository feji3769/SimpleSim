test_that("test that S-curve simulation works. ", {
  N = 100
  sigma = 0.1
  result = SimSCurve(N, sigma)
  expect_equal(length(result$t), N)
  expect_equal(dim(result$x), c(N, 3))
  
  expect_error(SimSCurve(-1, 10))
  expect_error(SimSCurve("-1", 10))
  
  expect_error(SimSCurve(c(10,101), 10))
  })
