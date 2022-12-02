test_that("moh_colours works", {

  moh_test_palette = c(darkBlue = '#002664',
                       red = '#D7153A',
                       lightBlue = '#00ABE6',
                       medBlue = '#0A7CB9',
                       lightGrey = '#BFBFBF',
                       darkGrey = '#4F4F4F',
                       black = '#000000',
                       yellow = '#F9BE00',
                       orange = '#FF7F2F',
                       purple = '#752F8A')

  #p <- moh_colours(show_colours = T)

  picked_colours <- moh_colours()

  expect_length(picked_colours, 10)

  expect_identical(picked_colours,  unname(moh_test_palette))

  picked_colours <- moh_colours(1:4)

  expect_identical(picked_colours,  unname(moh_test_palette[1:4]))

  picked_colours <- moh_colours(c(1,4,7,8))

  expect_identical(picked_colours,  unname(moh_test_palette[c(1,4,7,8)]))

  picked_colours <- moh_colours(c('darkBlue', 'red', 'black'))

  expect_identical(picked_colours,  unname(moh_test_palette[c('darkBlue', 'red', 'black')]))

  picked_colours <- moh_colours(c(1,1,2,2))

  expect_identical(picked_colours,  unname(moh_test_palette[c(1,1,2,2)]))

  expect_error(moh_colours(1:11))
  expect_error(moh_colours(c('foo', 'bar')))

})
