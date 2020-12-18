# Visualization Package with ggplot2
- Developed an R package to graphs an entire dataset with one line of code for exploratory purposes
- The package is an extension of ggplo2
- The package contains two functions:
  - scatter_plot_all(dataset, col_x = "attribute"), which creates many scatter plots with the argument attribute on the x-axis of every generated plot and one other attribute on the y-axis
  - hex_plot_all(dataset, col_x = "attribute"), which creates many hex plots with the argument attribute on the x-axis of every generated plot and one other attribute on the y-axis
- This single line of code generated the following plots:

hex_plot_all(iris, col_x = "Sepal.Length", col_fill = "Species")

![alt text](https://github.com/salhasan/beyondggplot/blob/master/images/beyondggplot_1.png)

![alt text](https://github.com/salhasan/beyondggplot/blob/master/images/beyondggplot_2.png)

![alt text](https://github.com/salhasan/beyondggplot/blob/master/images/beyondggplot_3.png)
