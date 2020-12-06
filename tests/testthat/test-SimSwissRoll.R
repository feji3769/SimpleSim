test_that("Swiss Roll output is correct.", {
  N = 100
  sigma = 0.1
  result = SimSwissRoll(N, sigma)
  expect_equal(dim(result$data), c(N, 3))
  expect_equal(length(result$t), N)
  result = SimSwissRoll(N, sigma, seed = 1)
  expect_equal(dim(result$data), c(N, 3))
  expect_equal(length(result$t), N)
  
  expect_error(SimSwissRoll(1.1, .1))
  expect_error(SimSwissRoll(1, -1))
  expect_error(SimSwissRoll(-1, .1))
  expect_error(SimSwissRoll(N, sigma, seed = -1))
})

