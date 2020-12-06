test_that("multiplication works", {
  # does the basic function work?
  N = 100
  sigma = 0.1 
  result = SimFriedman3(N, sigma)
  expect_equal(length(result$y), N)
  expect_equal(dim(result$x), c(N, 4))
  
  # does setting seed break basic functionality?
  N = 100
  sigma = 0.1 
  result = SimFriedman3(N, sigma, seed = 1)
  expect_equal(length(result$y), N)
  expect_equal(dim(result$x), c(N, 4))
  
  #some basic error checks.
  expect_error(SimFriedman3(-1, .1))
  expect_error(SimFriedman3(1, 0))
  expect_error(SimFriedman3(-1, -1))
  expect_error(SimFriedman3(10.1, 1))
  expect_error(SimFriedman3("-1", 1))
  
})
