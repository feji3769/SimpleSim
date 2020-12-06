test_that("test if inputs checks work", {
  
  # vec check
  expect_error(.checkVector(c('1'), "wrong type!"))
  expect_equal(.checkVector(c(2,2,3), "is vec"), T)
  expect_equal(.checkVector(3, "not vec"), F)  
  
  # check positive
  expect_error(.checkPositive("a", "letter"))
  expect_error(.checkPositive(0, "not positive")) 
  expect_error(.checkPositive(-1, "negative")) 
  
  # require matrix
  expect_error(.requireMatrix(matrix(c("a")), "not numeric"))
  expect_error(.requireMatrix(matrix(c(1, NA)), "contains NA"))
  expect_error(.requireMatrix(c(11), "not numeric"))
  
  # require vector
  expect_error(.requireVector(c("a"), "not numeric"))
  expect_error(.requireVector(8, "not vector"))
  
  
  # require constant
  expect_error(.requireConstant("a", "not numeric"))
  expect_error(.requireConstant(c(2,2,34), "vector input"))
  
  
  # require whole
  expect_error(.requireWhole(1.2, "not whole"))
})




