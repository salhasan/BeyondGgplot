#' @title scatte plot all
#'
#' @description scatter plot all attributs of a dataset or dataframe
#' 
#'

#' @param df A dataframe from sctr_plt()
#' @param col_x the column to be plotted on the x-axis
#' @param col_color the column to determine color of points
#' @param col_shape the column to be determine shape of points
#' @param col_size the column to be determine size of points
#' @return a list of scatter plots
#' @export

scatter_plot_all <- function(df, col_x = NULL, col_color = NULL,
                             col_shape = NULL, col_size =NULL) {
  
  # select columns for y_axis 
  if (!missing(col_color) && !missing(col_shape)) {
    new_col_names<-  select(df, c(- col_x, - col_color, - col_shape)) %>% colnames()
  }
  else if (!missing(col_color)) {
    new_col_names<-  select(df, c(- col_x, - col_color)) %>% colnames()
  } else if (!missing(col_shape)) {
    new_col_names<- select(df, c(- col_x, - col_shape)) %>% colnames()
  } else 
    new_col_names<- select(df,- col_x) %>% colnames()
  
  
  # apply sctr_plt on selected columns
  lapply(new_col_names, sctr_plt, df = df, column_x = col_x,
         column_color = col_color, column_shape = col_shape, column_size = col_size)
  
}




sctr_plt <- function (df, column_x, column_y, column_color= NULL,
                      column_shape = NULL , column_size = NULL ,
                      title = paste(column_x, "vs",column_y )) {
  
  ggplot(df, aes_string(x=column_x, y=column_y,
                        color = column_color,shape = column_shape, size = column_size )) +
    geom_point(alpha = 0.7) +
    theme_bw(15) +
    ggtitle(title)+
    theme( plot.title = element_text(hjust = 0.5)) +
    theme(legend.position = "left") +
    theme(
      legend.box.background = element_rect(),
      legend.box.margin = margin(1, 1, 1, 1)) +
    theme(panel.background = element_blank(),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_blank()
    )
  
  
}