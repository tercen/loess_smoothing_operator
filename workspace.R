library(tercen)
library(dplyr)

options("tercen.workflowId" = "d330322c43363eb4f9b27738ef0042b9")
options("tercen.stepId"     = "1ae42627-e9ce-4d9f-9797-8700adfd7718")

do.loess <- function(df, n_preds, span) {
  m <- loess(.y ~ .x, data = df, span = span)
  x_pred <- seq(min(df$.x), max(df$.x), length.out = n_preds)
  y_pred <- predict(m, newdata = data.frame(.x = x_pred))
  df_out <- data.frame(
    .ri = df$.ri[1],
    .ci = df$.ci[1],
    x_pred = x_pred,
    y_pred = y_pred
  )
  return(df_out)
}

ctx <- tercenCtx()

n_preds <- 1000
if(!is.null(ctx$op.value('n_preds'))) n_preds <- as.numeric(ctx$op.value('n_preds'))
span <- 0.75
if(!is.null(ctx$op.value('span'))) span <- as.numeric(ctx$op.value('span'))

ctx %>% 
  select(.ci, .ri, .x, .y) %>%
  group_by(.ci, .ri) %>%
  do(do.loess(., n_preds, span)) %>% 
  ctx$addNamespace() %>%
  ctx$save()

