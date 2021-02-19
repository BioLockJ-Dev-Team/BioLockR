test_that("propInfo returns list with expected named values", {
    info = propInfo()
    expect_true("script.numThreads" %in% names(info))
    expect_true( length(info) > 50 )
    expect_true( length(info) < 500 )
    numThreads = info[["script.numThreads"]]
    expect_equivalent(numThreads$property, "script.numThreads")
    expect_equivalent(numThreads$type, "integer")
    expect_true(is.numeric(as.numeric(numThreads$default)))
    expect_true(nchar(numThreads$description) > 10 )
})
