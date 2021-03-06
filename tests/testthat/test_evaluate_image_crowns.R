context("Check image crown evaluation")
library(dplyr)

test_that("Image crown summaries", {
  results <- submission %>%
    filter(plot_name %in% "SJER_052") %>% evaluate_image_crowns(.,summarize = T,project = T)
  expect_equal(length(results),4)

  #Overall
  expect_equal(dim(results[["overall"]]),c(1,2))
  expect_equal(results[["overall"]]$precision,1)

  #By Site
  expect_equal(colnames(results[["by_site"]]),c("Site","recall","precision"))

  #plot_level
  expect_equal(colnames(results[["plot_level"]]),c("plot_name","submission","ground_truth"))
})
