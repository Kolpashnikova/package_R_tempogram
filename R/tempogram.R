#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
tempogram <- function(df, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data = df,
    message = "works"
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'tempogram',
    x,
    width = width,
    height = height,
    package = 'tempogram',
    elementId = elementId
  )
}

#' Shiny bindings for tempogram
#'
#' Output and render functions for using tempogram within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a tempogram
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name tempogram-shiny
#'
#' @export
tempogramOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'tempogram', width, height, package = 'tempogram')
}

#' @rdname tempogram-shiny
#' @export
renderTempogram <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tempogramOutput, env, quoted = TRUE)
}
