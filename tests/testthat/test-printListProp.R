test_that("printListProp works for a vector - standard use case", {
  expect_equal(printListProp(c("one", "two", "three")), "one, two, three")
})

test_that("printListProp works for a list", {
    expect_equal(printListProp(as.list(c("one", "two", "three"))), "one, two, three")
})

test_that("printListProp never fails on bs input, returns empty string", {
    expect_equal(printListProp(c()), "")
    expect_equal(printListProp(NA), "")
    expect_equal(printListProp(NULL), "")
    expect_equal(printListProp(""), "")
})

