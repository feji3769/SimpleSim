test_that("SimNormalMix output is as expected.", {
  # simulate data.
  N = 100
  mu = c(1,2,3)
  sigma = rep(0.1, 3)
  p = c(0.3, 0.4, 0.3)
  result = SimNormalMix(N, mu, sigma, p)
  
  # check data
  expect_equal(length(result$x), N) # correct number of samples.
  expect_equal(length(unique(result$y)), 3) # correct number of classes.
  expect_lt(max(result$x), 4.1) # data range is good?
  expect_gt(min(result$x), -0.1)
})

