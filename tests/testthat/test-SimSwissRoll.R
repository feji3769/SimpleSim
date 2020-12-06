test_that("Swiss Roll output is correct.", {
  
  # does basic function work?
  N = 100
  sigma = 0.1
  result = SimSwissRoll(N, sigma)
  expect_equal(dim(result$data), c(N, 3))
  expect_equal(length(result$t), N)
  
  # does basic functino work with set seed?
  result = SimSwissRoll(N, sigma, seed = 1)
  expect_equal(dim(result$data), c(N, 3))
  expect_equal(length(result$t), N)
  
  
  # error checks. 
  expect_error(SimSwissRoll(1.1, .1)) # bad N 
  expect_error(SimSwissRoll(1, -1)) # bad sigma 
  expect_error(SimSwissRoll(-1, .1)) # bad N 
  expect_error(SimSwissRoll(1, ".1")) # bad sigma
  expect_error(SimSwissRoll("1", .1)) # bad N
  expect_error(SimSwissRoll(N, sigma, seed = -1)) # bad seed
  expect_error(SimSwissRoll(N, sigma, seed = .1)) # bad seed
  
  
  
  
})

