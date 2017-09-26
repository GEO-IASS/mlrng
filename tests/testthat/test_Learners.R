context("Learners")

test_that("as.data.table", {
  x = as.data.table(Learners)
  expect_data_table(x, min.rows = 2, key = "id")
  expect_character(x$name, any.missing = FALSE)
  expect_character(x$type, any.missing = FALSE)
  expect_character(x$id, any.missing = FALSE)
  expect_list(x$properties, types = "character")
  expect_list(x$packages, types = "character")
})