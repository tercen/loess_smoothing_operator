# LOESS smoothing operator

##### Description

The `loess_smoothing_operator` performs a curve fitting of y values against x values based on a local regression (LOESS/LOWESS).

##### Usage

Input projection|.
---|---
`x-axis`        | numeric, x values, per cell
`y-axis`        | numeric, y values, per cell

Input parameters|.
---|---
`n_preds`        | numeric, number of points to generate predictions for (length or a regular sequence along x's range).
`span`        | numeric, span parameter for loess smoothing (higher = smoother). 

Output relations|.
---|---
`x_pred`        | x values used for predictions, per cell
`y_pred`        | predicted y values, per cell

##### Details

This computation is based on the [loess R function](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/loess).

##### See Also

[lm_operator](https://github.com/tercen/lm_operator)

