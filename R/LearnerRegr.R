#' @include Learner.R

LearnerRegr = R6Class("LearnerRegr",
  inherit = Learner,
  public = list(
    initialize = function(type, name, par.set, par.vals = list(), packages = character(0L), properties = character(0L), train, predict, model.extractors = list()) {
      super$initialize(type, name, par.set, par.vals = list(), packages = character(0L), properties = character(0L), train, predict, model.extractors,
        allowed.predict.types = c("response", "se"), predict.type = "response")
    }
  )
)
