test_that("group_ages stopifnots work", {

  ages <- 1:10
  ages_character <- as.character(ages)

  expect_error(group_ages(ages_character))
  expect_error(group_ages(ages, max_age = c(90, 95)))
  expect_error(group_ages(ages, max_age = '95'))
  expect_error(group_ages(ages, max_age = 90, by = 1:2))
  expect_error(group_ages(ages, max_age = '95', by = '1'))

})

test_that("group_ages throws warning for < 0 ages", {

  ages <- -1:5

  expect_warning(group_ages(ages))

})

test_that("group_ages returns correct output", {

  ages <- 0:110
  ages_grouped <- group_ages(ages, by = 1, max_age = 100)

  expect_equal(length(ages_grouped), length(ages))
  expect_s3_class(ages_grouped, 'factor')
  expect_equal(nlevels(ages_grouped), 101)

  expect_true(all(ages_grouped[ages >= 100] %in% '100+'))

  ages_grouped <- group_ages(ages, by = 1, max_age = 95)

  expect_true(all(ages_grouped[ages >= 95] %in% '95+'))

})
