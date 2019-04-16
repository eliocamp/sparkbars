#' Prints sparkbars from the data
#'
#' @param x a vector with the data to plot.
#' @param midpoint midpoint that marks the "zero" line.
#' @param colors whether to use colors or not.
#' @param range whether to print the range.
#'
#'
#' @examples
#' x <- rnorm(10)
#' sparkbars(x, colors = TRUE)
#' sparkbars(x, midpoint = 1, colors = TRUE)
#'
#' @export
sparkbars <- function(x, midpoint = 0, colors = FALSE, range = TRUE) {
  normalised <- rep(0, length(x))
  M <- max(x, na.rm = TRUE)
  m <- min(x, na.rm = TRUE)
  x_centered <- x - midpoint

  positive <- x_centered > 0 & !is.na(x_centered)
  negative <- x_centered < 0 & !is.na(x_centered)

  normalised[x_centered != 0 & !is.na(x_centered)] <- as.numeric(cut(abs(x_centered[x_centered != 0 & !is.na(x_centered)]), breaks = 6))
  normalised[negative] <- 7 - normalised[x_centered < 0 & !is.na(x_centered)]
  normalised[is.na(x_centered)] <- 99
  # x_centered[is.na(x_centered)] <- 0
  spark <- rep(" ", length = length(normalised))

  spark <- lookup_bars[as.character(normalised)]

  # spark[negative] <- paste0("\033[7m", spark[negative], "\033[27m")  # inverse

  spark[negative] <- crayon::inverse(spark[negative])

  if (isTRUE(colors)) {
    # spark[positive] <- paste0("\033[31m", spark[positive], "\033[39m")  # red
    spark[positive] <- crayon::red(spark[positive])
    # spark[negative] <- paste0("\033[34m", spark[negative], "\033[39m")  # blue
    spark[negative] <- crayon::blue(spark[negative])
  }

  if (isTRUE(range)) {
    M <- as.character(signif(max(x), 2))
    m <- as.character(signif(min(x), 2))
    m_char <- max(nchar(M), nchar(m))

    M <- formatC(M, width = m_char, flag = " ")
    m <- formatC(m, width = m_char, flag = " ")

    attr(spark, "range") <- c(m, M)
  }
  # attr(spark)
  attr(spark, "x") <- x_centered
  attr(spark, "class") <- c("sparkbar_sparkbar")
  # print(spark)
  return(spark)
  # return(invisible(x))
}


#' @export
print.sparkbar_sparkbar <- function(x, ...) {
  spark <- x
  x <- attr(spark, "x")
  width <- options()$width
  N <- length(spark)
  start <- seq(1, N, by = width)
  end <- c(start - 1, N)[-1]
  for (s in seq_along(start)) {
    chunk <- seq(start[s], end[s])
    this_spark <- spark[chunk]
    mostattributes(this_spark) <- attributes(spark)
    this_x <- x[chunk]
    print_spark_oneline(this_spark, this_x)
    if (length(start) > 1 & s < length(start)) cat("\n")
  }
  # invisible(spark)
}

print_spark_oneline <- function(spark, x) {
  # Print positives
  r <- attr(spark, "range")
  if (!is.null(r)) {
    cat(r[2], "\U250C ")
  }

  for (i in seq_along(spark)) {
    if (x[i] >= 0 | is.na(x[i])) {
      cat(spark[i])
    } else {
      cat(" ")
    }
  }
  cat("\n")

  # Print negatives
  if (!is.null(r)) {
    cat(r[1], "\U2514 ")
  }
  for (i in seq_along(spark)) {
    if (x[i] < 0  | is.na(x[i])) {
      cat(spark[i])
    } else {
      cat(" ")
    }
  }
}

lookup_bars <- c("0" = "\033[4m \033[24m",
                 "1" = "\U2582",
                 "2" = "\U2583",
                 "3" = "\U2584",
                 "4" = "\U2585",
                 "5" = "\U2586",
                 "6" = "\U2587",
                 "99" = "\U2591")
