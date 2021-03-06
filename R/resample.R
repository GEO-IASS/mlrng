#' @title Resample a Learner on a Task
#'
#' @description
#' Runs a resampling (possibly in parallel).
#'
#' @param task [\code{\link{Task}}]\cr
#'   Object of type \code{\link{Task}}.
#' @param learner [\code{\link{Learner}}]\cr
#'   Object of type \code{\link{Learner}}.
#' @param resampling [\code{\link{Resampling}}]\cr
#'   Object of type \code{\link{Resampling}}.
#' @param measures [\code{list} of \code{\link{Measure}}]\cr
#'   List of objects of type \code{\link{Measure}}.
#' @return \code{\link{ResampleResult}}.
#' @export
resample = function(task, learner, resampling, measures) {
  assertTask(task)
  assertLearner(learner, for.task = task)
  assertResampling(resampling, for.task = task)
  assertMeasures(measures, for.task = task, for.learner = learner)

  # FIXME: why is store.model not an option here?

  if (is.null(resampling$instance))
    resampling = resampling$clone()$instantiate(task)

  pm.level = "mlrng.resample"
  parallelLibrary(packages = "mlrng", master = FALSE, level = pm.level)
  results = parallelMap(
    runExperiment,
    resampling.iter = seq_len(resampling$iters),
    more.args = list(task = task, learner = learner, measures = measures, resampling = resampling),
    level = pm.level
  )

  ResampleResult$new(results)
}
