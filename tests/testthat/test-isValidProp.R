test_that("valid prop returns true", {
  expect_true(isValidProp("script.numThreads", 8))
})
test_that("invalid prop returns false", {
    expect_false(isValidProp("script.numThreads", "apple"))
})
test_that("unrecognized prop returns NA", {
    expect_true(is.na(isValidProp("hardyhar", 'har')))
})
