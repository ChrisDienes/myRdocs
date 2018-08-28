

starter          <- function(fig_width = 6,
                             fig_height = 6,
                             toc = TRUE,
                             toc_float = TRUE,
                             number_sections = TRUE,
                             self_contained = TRUE,
                             fig_caption = TRUE,
                             highlight = "espresso",
                             theme = "cerulean",
                             mathjax = "myRdocs",
                             lightbox = FALSE,
                             thumbnails = FALSE,
                             gallery = FALSE,
                             pandoc_args = NULL,
                             ...){

  # get the locations of resource files located within the package
  mytemplate <- system.file("templates/starter/starter.html", package = "myRdocs")

  # pandoc args:
  if (!is.null(mathjax)) {
    pandoc_args <- c(pandoc_args, "--mathjax", "--variable", "mathjax-url: https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML")
  }
  if (lightbox) { pandoc_args <- c(pandoc_args, "--variable", "lightbox:true") }
  if (thumbnails) { pandoc_args <- c(pandoc_args, "--variable", "thumbnails:true") }
  if (gallery) {
    pandoc_args <- c(pandoc_args, "--variable", "gallery:true")
  } else {
    pandoc_args <- c(pandoc_args, "--variable", "gallery:false")
  }

  # call the base html_document function
  rmarkdown::html_document(template = mytemplate,
                           toc = toc,
                           fig_width = fig_width,
                           fig_height = fig_height,
                           toc_float = toc_float,
                           number_sections = number_sections,
                           self_contained = self_contained,
                           fig_caption = fig_caption,
                           highlight = highlight ,
                           theme = theme,
                           pandoc_args = pandoc_args)

}
