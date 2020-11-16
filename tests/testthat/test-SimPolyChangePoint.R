test_that("Change Point poly output is correct.", {
  N = 100
  noise = .1
  xRange = c(0,1)
  x0 = .5
  m1 = c(1,2)
  m2 = c(5,2)
  result = SimPolyChangePoint(N, noise, xRange, x0, m1, m2)
  expect_equal(dim(result$data), c(N,2))
  expect_equal(result$x0, x0)
  expect_equal(result$data[1,1], xRange[1])
  expect_equal(result$data[N,1], xRange[2])
  
})
