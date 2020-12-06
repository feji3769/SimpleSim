test_that("SimFriedman1 works", {
  
  # does the basic function work?
  N = 10
  nFeatures = 5
  sigma = .1
  result = SimFriedman1(N, nFeatures, sigma)
  expect_equal(length(result$y), N)
  expect_equal(dim(result$x), c(N, nFeatures))
  # does the basic function work when seed is set?
  N = 10
  nFeatures = 5
  sigma = .1
  result = SimFriedman1(N, nFeatures, sigma, seed = 1)
  expect_equal(length(result$y), N)
  expect_equal(dim(result$x), c(N, nFeatures))
  
  
  
  # error checks.
  expect_error(SimFriedman1(1.1,6,1))
  expect_error(SimFriedman1(1,2,1))
  expect_error(SimFriedman1(1,6,-1))
  
  # error checks. 
  expect_error(SimFriedman1("1.1",6,1))
  expect_error(SimFriedman1(1,"2",1))
  expect_error(SimFriedman1(1,6,"-1"))
})
