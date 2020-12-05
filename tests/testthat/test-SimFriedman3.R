test_that("multiplication works", {
  N = 100
  sigma = 0.1 
  result = SimFriedman3(N, sigma)
  expect_equal(length(result$y), N)
  expect_equal(dim(result$x), c(N, 4))
  
  expect_error(SimFriedman3(-1, .1))
  expect_error(SimFriedman3(1, 0))
  expect_error(SimFriedman3(-1, -1))
})
