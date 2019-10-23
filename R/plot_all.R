#' @title Scatter Plotting all columns of a dataframe

sctr_plt <- function (df, column_x, column_y, column_color= NULL,
                      column_shape = NULL , column_size = NULL ,title = paste(column_x, "vs",column_y )) {

  ggplot(df, aes_string(x=column_x, y=column_y,
                        color = column_color,shape = column_shape, size = column_size )) +
    geom_point(alpha = 0.7) +
    theme_bw() +
    ggtitle(title)+
    theme( plot.title = element_text(hjust = 0.5)) +
    theme(legend.position = "left")


}

#' @param df A dataframe
#' @param col_x the column to be plotted on the x-axis
#' @param col_color the column to determine color of points
#' @param col_shape the column to be determine shape of points
#' @param col_size the column to be determine size of points
#' @export

plot_all <- function(df, col_x = NULL, col_color = NULL,
                     col_shape = NULL, col_size =NULL)
{
  lapply(colnames(df), sctr_plt, df = df, column_x = col_x,
         column_color = col_color, column_shape = col_shape, column_size = col_size)

}
