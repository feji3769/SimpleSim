test_that("SimFriedman2 works", {
  
# does the return match expectation?
N = 100
sigma = 0.1
result = SimFriedman2(N, sigma)
expect_equal(length(result$y), N)
expect_equal(dim(result$x), c(N, 4))

# does the return match expectation with set seed?
N = 100
sigma = 0.1
result = SimFriedman2(N, sigma, seed = 1)
expect_equal(length(result$y), N)
expect_equal(dim(result$x), c(N, 4))
  
# do errors get caught?
expect_error(SimFriedman2(2.1, .1)) # bad N
expect_error(SimFriedman2(20, -.1)) # bad sigma
expect_error(SimFriedman2(20, 0)) # bad sigma 
expect_error(SimFriedman2(20, "0")) # non-numeric input


})
