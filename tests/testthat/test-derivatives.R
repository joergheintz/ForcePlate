time = 1:5
distance = (1:5)^2
expected.result = data.frame(t = c(1:5),y = c(1:5)^2, y. = c(NA, 4,6,8, NA), y.. = c(NA, 2, 2, 2, NA))

test_that("derivates() calculate derivatives", {
      expect_equal(derivatives(y = distance, t = time), expected.result)
})

