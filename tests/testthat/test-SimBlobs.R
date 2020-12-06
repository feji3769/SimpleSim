test_that("Sim blobs works", {
  N = c(2,2,2)
  centers = centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
  result = SimBlobs(N, centers = centers)
  expect_equal(length(result$y), sum(N))
  
  
  expect_error(SimBlobs(-1))
  expect_error(SimBlobs(10, -1))
  expect_error(SimBlobs(10, 3, -1))
  
  expect_error(SimBlobs(10, 3, -1))
  expect_error(SimBlobs(10, centerBox = c(1, 0)))
  
})
