#' Logit to probability transformer
#'
#' Transform a logit to a probability
#'
#' @param logit numeric value or vector of logits
#' @export
logit2prob <- function(logit){
  base::stopifnot('logit must be numeric' = is.numeric(logit))
  odds <- exp(logit)
  prob <- odds / (1 + odds)
  return(prob)
}

#' Probability to logit transformer
#'
#' Transform a probability to a logit
#'
#' @param prob numeric value or vector of probabilities between 0 and 1
#' @export
prob2logit <- function(prob){
  base::stopifnot('prob must be numeric' =  base::is.numeric(prob),
            'prob must be within 0 and 1' = prob < 0 | prob > 0)
  odds = prob / (1 - prob)
  logit = log(odds)
  return(logit)
}

