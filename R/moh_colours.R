#' NSW goverment branding colours
#'
#' A number of colours from https://www.digital.nsw.gov.au/design-system/style/colour
#'
#' @param ... Integer or characters vector. See details
#' @param show_colours Boolean. If TRUE a barplot of the colours with their names is shown
#'
#' @details
#' You can use indicies to select colours, or the colour names themselves. Use moh_colours(show_colours = T)
#' to see what is available
#'
#' @examples
#' # show colours and names
#' moh_colours(show_colours = T)
#'
#' # Return all colours
#' moh_colours() -> all ten colours
#'
#' # Return first 4 colours
#' moh_colours(1:4) -> first 4 colours
#'
#' # Return colours by name
#' moh_colours(c('darkBlue', 'red')) -> colours by name ()
#'
#' @export
moh_colours = function(..., show_colours = F){

  moh_palette = c(darkBlue = '#002664',
                  red = '#D7153A',
                  lightBlue = '#00ABE6',
                  medBlue = '#0A7CB9',
                  lightGrey = '#BFBFBF',
                  darkGrey = '#4F4F4F',
                  black = '#000000',
                  yellow = '#F9BE00',
                  orange = '#FF7F2F',
                  purple = '#752F8A')

  if (show_colours) {
    par(mar = c(1,8,1,1))
    barplot(rep(1, length(moh_palette)),
            horiz = T,
            space = 0.1,
            col = rev(moh_palette),
            border = NA,
            names.arg = paste0(10:1, ' - ', rev(names(moh_palette))),
            las = 1,
            xaxt = 'n')
  } else {

    cols <- c(...)

    if (is.null(cols)) return (unname(moh_palette))

    unname(moh_palette[cols])

  }
}

#' NSW goverment branding colour scale for ggplot2
#'
#' A number of colours from https://www.digital.nsw.gov.au/design-system/style/colour
#'
#' @examples
#'
#' require(ggplot2)
#'
#'ggplot(
#'  data.frame(
#'    names = c('darkBlue', 'red', 'lightBlue',
#'              'medBlue', 'lightGrey', 'darkGrey',
#'              'black', 'yellow', 'orange', 'purple'),
#'    vals = rep(1,10)),
#'  aes(x = names, y = vals, fill = names)) +
#'  geom_col() +
#'  scale_fill_moh() +
#'  theme_void()
#'
#'ggplot(
#'  data.frame(
#'    names = c('darkBlue', 'red', 'lightBlue',
#'              'medBlue', 'lightGrey', 'darkGrey',
#'              'black', 'yellow', 'orange', 'purple'),
#'    vals = rep(1,10)),
#'  aes(x = names, y = vals, colour = names)) +
#'  geom_col(size = 3, fill = 'white') +
#'  scale_colour_moh() +
#'  theme_void()
#'
#'
#' @name moh_ggplot
NULL

#' @describeIn moh_ggplot
#' Scale fill
#' @export
scale_fill_moh <- function() {

  ggplot2::discrete_scale(aesthetics = 'fill',
                          scale_name = 'moh',
                          palette = function(n){ moh_colours(1:n) })
}

#' @describeIn moh_ggplot
#' Scale color
#' @export
scale_colour_moh <- function() {

  ggplot2::discrete_scale(aesthetics = 'colour',
                          scale_name = 'moh',
                          palette = function(n){ moh_colours(1:n) })
}
