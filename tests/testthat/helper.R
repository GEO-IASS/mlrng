library(checkmate)
library(testthat)
library(stringi)
library(phng)

`[[.R6` = function(x, i, ...) {
  if (!backports:::hasName(x, i))
    stop("R6 class ", paste0(class(x), collapse = "/") ," does not have slot '", i, "'!")
  get(i, envir = x)
}

`$.R6` = function(x, name) {
  if (!backports:::hasName(x, name))
    stop("R6 class ", paste0(class(x), collapse = "/") ," does not have slot '", name, "'!")
  get(name, envir = x)
}

private = function(x) {
  if (!R6::is.R6(x))
    stop("Expected R6 class")
  x$.__enclos_env__[["private"]]
}

result_state = function(x) {
  if (R6::is.R6(x))
    x = class(x)[1L]
  fastmatch::fmatch(x, mlrng$result.states)
}
