test_that("SimFriedman1 works", {
  N = 10
  nFeatures = 5
  sigma = .1
  result = SimFriedman1(N, nFeatures, sigma)
  expect_equal(length(result$y), N)
  expect_equal(dim(result$x), c(N, nFeatures))
  
  expect_error(SimFriedman1(1.1,6,1))
  expect_error(SimFriedman1(1,2,1))
  expect_error(SimFriedman1(1,6,-1))
  
  expect_error(SimFriedman1("1.1",6,1))
  expect_error(SimFriedman1(1,"2",1))
  expect_error(SimFriedman1(1,6,"-1"))
})
