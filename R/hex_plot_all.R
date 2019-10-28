#' @title hex plot all
#'
#' @description hex plot all attributs of a dataset or dataframe
#' 
#'
#' @param df A dataframe from hex_plt()
#' @param col_x the column to be plotted on the x-axis
#' @param col_fill the column to determine the fill color of points
#' @return a list of hex plots
#' @export


hex_plot_all <- function(df, col_x = NULL,
                         col_fill = NULL)
{
  # select columns for y_axis 
  
  if (!missing(col_fill)) {
    new_col_names<-  select(df, c(- col_x, - col_fill)) %>% colnames()
  } else
    new_col_names <- select(df, - col_x) %>% colnames()
  
  # apply box_plt on selected columns
  lapply(new_col_names, hex_plt, df = df, column_x = col_x,
         column_group = col_group, column_fill = col_fill)
  
}



hex_plt <-  function (df, column_x, column_y, column_group, column_fill,
                       title = paste(column_x, "vs",column_y )) {
  
  ggplot(df, aes_string(x= column_x, y= column_y,
                        fill = column_fill)) +
    geom_hex( bins = 30) +
    theme_bw(15) +
    ggtitle(paste(column_x, "vs",column_y )) +
    theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5)) +
    theme(
      legend.box.background = element_rect(),
      legend.box.margin = margin(1, 1, 1, 1)) +
    theme(panel.background = element_blank(),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_blank()) +
    theme(panel.background = element_rect(fill = "white"))
}
