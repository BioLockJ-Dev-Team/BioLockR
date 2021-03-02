test_that("moduleInfo() gives reasonable results", {
    info = moduleInfo()
    expect_true( length(info) > 20 )
    expect_true( length(info) < 1000 )
    expect_true( "biolockj.module.diy.GenMod" %in% names(info) )
})
