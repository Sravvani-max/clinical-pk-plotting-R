library(ggplot2)

plot_pk_flexible <- function(data,
                             y_var,
                             color_var,
                             group_var,
                             log_scale,
                             facet_var,
                             shape_var,
                             show_lloq,
                             show_errorbar,
                             ymin_var,
                             ymax_var,
                             lloq,
                             title,
                             xlabel,
                             ylabel){
  
  if (log_scale == TRUE) {
    data <- data %>%
      filter(.data[[y_var]] > 0)
  }
  
  if(is.null(shape_var)) {
    p <- ggplot( data,
                 aes(x = TIME,
                     y = .data[[y_var]],
                     color = .data[[color_var]],
                     group = .data[[group_var]]
                 ))
  } else {
    p <- ggplot( data,
                 aes(x = TIME,
                     y = .data[[y_var]],
                     color = .data[[color_var]],
                     group = .data[[group_var]],
                     shape = .data[[shape_var]]
                 ))  +
       scale_shape_manual(values = c(16,17))
  }
  
  p <- p +
        geom_line(linewidth = 1.2)+
        geom_point(size = 3) +
    labs(
      title = title,
      x = xlabel,
      y = ylabel
    )+
    theme_minimal()
  
  if(log_scale == TRUE) {
    p <- p+
         scale_y_log10()
  }
    
  if (!is.null(facet_var)) {
    p <- p + facet_wrap(vars(.data[[facet_var]]))
  }
  
  if (show_lloq == TRUE && !is.null(lloq)) {
    p <- p +
      geom_hline(yintercept = lloq, linetype = "dashed") +
      annotate("text", x= 10, y = lloq + 0.5, label = "LLOQ")
  } 
  
  if(show_errorbar == TRUE &&
     !is.null(ymin_var) &&
     !is.null(ymax_var)) {
    p <- p +
         geom_errorbar(
           aes(
             ymin = .data[[ymin_var]],
             ymax = .data[[ymax_var]]
           ),
           width = 0.2
         )
  }
  
  return(p)
}
