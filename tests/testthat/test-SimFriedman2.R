test_that("SimFriedman2 works", {
N = 100
sigma = 0.1
result = SimFriedman2(N, sigma)
expect_equal(length(result$y), N)
expect_equal(dim(result$x), c(N, 4))
  

expect_error(SimFriedman2(2.1, .1))
expect_error(SimFriedman2(20, -.1))
expect_error(SimFriedman2(20, 0))

})
