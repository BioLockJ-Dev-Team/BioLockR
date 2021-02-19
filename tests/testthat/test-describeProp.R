test_that("return correct description", {
  expect_equal(describeProp("script.numThreads"), "Used to reserve cluster resources and passed to any external application call that accepts a numThreads parameter.")
})

test_that("unrecognized prop does not cause error", {
    expect_equal(describeProp("hardyHarHar"), "null")
})
