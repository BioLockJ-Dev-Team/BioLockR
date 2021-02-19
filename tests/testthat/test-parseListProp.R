test_that("parseListProp works for a vector - standard use case", {
    expect_equal(parseListProp("one,two,three"), c("one", "two", "three"))
})

test_that("parseListProp never fails on bs input, returns NULL", {
    expect_equal(parseListProp(c()), NULL)
    expect_equal(parseListProp(NA), NULL)
    expect_equal(parseListProp(NULL), NULL)
    expect_equal(parseListProp(""), NULL)
})
