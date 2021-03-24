#' Convert to an MoH HTML document
#'
#' Format for converting from R Markdown to an HTML document.
#'
#' @param ... passed onto \code{rmarkdown::html_document}
#'
#' @export
html_document_moh <- function(...) {

  resource <- function(name) {
    if (missing(name)){
      system.file("rmarkdown/templates/moh-basic/resources", package = "MoHReportR")
    } else {
      system.file("rmarkdown/templates/moh-basic/resources", name, package = "MoHReportR")
    }
  }


  pandoc_resource_arg <- function(x){
    c("--resource-path", x)
  }

  rmarkdown::html_document(template = resource('default.html'),
                           css = c(resource('markdown.css'),
                                   resource('moh_stylesheet.css')))
                           #pandoc_args = c(pandoc_resource_arg(getwd()),
                            #               pandoc_resource_arg(resource())))


}
