#' Group ages into categorical age groups
#'
#' Group numeric ages into a factor using base::cut
#'
#' @param ages a numeric vector of ages
#' @param by age interval breaks
#' @param max_age maximum age after which ages are grouped into a max_age+ category e.g 100+
#'
#' @return vector of class factor
#'
#' @examples
#' group_ages(ages = 1:100, by=5, max_age=95)
#'
#' @export
group_ages <- function(ages, by = 1, max_age = 100){

  stopifnot('ages must be a numeric vector' = is.numeric(ages),
            'max_age must be a single value' = length(max_age) == 1,
            'max_age must be numeric' = is.numeric(max_age),
            'by must be a single value' = length(max_age) == 1,
            'by must be numeric' = is.numeric(by))

  if (any(ages < 0)){
    warning('Some input values are < 0. These wil be returned as NA')
  }

  breaks <- seq(0, max_age, by = by)
  labels <- sprintf('%s-%s', breaks, c(breaks[-1] - 1, '+'))
  labels[length(labels)] <- sub('-', '', labels[length(labels)])

  if (by == 1){
    labels = sub('-.*', '', labels)
  }

  base::cut(x = ages,
      breaks = c(breaks, Inf),
      labels = labels,
      right = F)
}
