test_that("printListProp works for a vector - standard use case", {
    expect_equivalent(printListProp(c("one", "two", "three")), "one, two, three")
})

test_that("printListProp works for a list", {
    aList = as.list(c("one", "two", "three"))
    returned = printListProp(aList)
    expected = "one, two, three"
    expect_equivalent(returned, expected)
})

test_that("printListProp never fails on bs input, returns empty string", {
    expect_equivalent(printListProp(c()), "")
    expect_equivalent(printListProp(NA), "")
    expect_equivalent(printListProp(NULL), "")
    expect_equivalent(printListProp(""), "")
})

