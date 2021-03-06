#' Find matches between predicted and ground truth tree based on maximum area of overlap.
#'
#' \code{assign_trees} implements the hungarian algorithm in \code{\link[clue]{solve_LSAP}} to match sets of trees
#' @param ground_truth A ground truth polygon in SpatialPolygonsDataFrame
#' @param predictions prediction polygons in SpatialPolygonsDataFrame
#' @return A data frame with the crown ID matched to the prediction ID.
assign_trees <- function(ground_truth, predictions) {

  # Find overlap among polygons
  overlap <- polygon_overlap_all(ground_truth, predictions)

  # Create adjacency matrix, rows are ground truth, columns are predictions
  adj_matrix_overlap <- reshape2::acast(overlap, crown_id ~ prediction_id)

  rows <- dim(adj_matrix_overlap)[1]
  columns <- dim(adj_matrix_overlap)[2]
  if (rows < columns) {
    # match ground truth to predictions
    assignment <- clue::solve_LSAP(adj_matrix_overlap, maximum = TRUE)
    assignmentdf <- data.frame(crown_id = rownames(adj_matrix_overlap), prediction_id = as.integer(assignment))
  } else {
    # transpose matrix to match predictions to ground truth
    adj_matrix_overlap <- t(adj_matrix_overlap)
    assignment <- clue::solve_LSAP(adj_matrix_overlap, maximum = TRUE)
    assignmentdf <- data.frame(crown_id = as.integer(assignment), prediction_id = rownames(adj_matrix_overlap))
  }

  return(assignmentdf)
}
