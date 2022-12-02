#' Convert to an MoH HTML document
#'
#' Format for converting from R Markdown to an HTML document.
#'
#' @param ... passed onto \code{rmarkdown::html_document}
#'
#' @export
html_document_moh <- function(...) {

  pandoc_resource_path <-
    c("--resource-path",
      base::system.file("rmarkdown/templates/moh-basic/resources", package = "MoHReportR")
    )

  rmarkdown::html_document(template = 'default.html',
                           css = c('markdown.css', 'moh_stylesheet.css'),
                           pandoc_args = pandoc_resource_path)

}
