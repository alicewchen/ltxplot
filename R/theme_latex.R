#' @name theme_latex
#' @title Add LaTeX theme to ggplot object
#' @description This function changes ggplot theme to LaTeX style
#' @keywords theme_latex
#' @import sysfonts
#' @import showtext
#' @import ggplot2
#' @export theme_latex
#' @export load_theme_ltx
#' @examples
#' library(ggplot2)
#' library(ltxplot)
#' load_theme_ltx()
#' df <- mtcars
#' df$carb <- as.factor(df$carb)
#' ggplot(df, aes(x=carb, fill = carb))+
#'   geom_bar(stat= "count", width=0.7)+
#'   labs(title = 'Number of cars with different number of carburetors', 
#'        x = "Number of carburetors", 
#'        y = "Number of car models",
#'        tag = 'Figure 1',
#'        caption = "Data source: mtcars") +
#'   theme_latex(base_size = 14) +
#'   theme(legend.position = "none")



# Add Latin Modern Roman font
# This is the default LaTeX font

load_theme_ltx<- function(){
  font_dir <- paste(system.file(package = "LTXplot"),"/extdata/fonts/", sep ="")
  sysfonts::font_paths(font_dir)

  if (!requireNamespace(c("sysfonts","showtext"), quietly = TRUE)) {
    stop("Package \"showtext\" needed to install custom font. Please install it.",
         call. = FALSE)
    } else {
      sysfonts::font_add(family = "lmroman",
                       regular = paste(font_dir, "lmroman10-regular-webfont.ttf", sep = ""),
                       bold = paste(font_dir, "lmromandemi10-regular-webfont.ttf", sep = ""),
                       italic = paste(font_dir, "lmroman10-italic-webfont.ttf", sep = ""),
                       bolditalic = paste(font_dir, "lmroman10-bolditalic-webfont.ttf", sep = ""))
      showtext::showtext_auto()
      }

    # Set global custom colorblind-friendly palette
  options(
      ggplot2.discrete.fill = list(
        c("#D55E00", "#0072B2"),
        c("#D55E00", "#0072B2","#009E73", "#F0E442"),
        c("#E69F00", "#56B4E9", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
      ))
  }

theme_latex <- function(font = "lmroman", base_size = 12) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package \"ggplot2\" needed for theme_latex() to work. Please install it.",
         call. = FALSE)
  } else {
    ggplot2::theme(

      # Plot text features
      plot.title = ggplot2::element_text(family=font,
                                         size=base_size*1.5,
                                         face="bold",
                                         color="#000000",
                                         hjust = 0),
      plot.subtitle = ggplot2::element_text(family=font,
                                            size=base_size*1.25,
                                            margin=ggplot2::margin(t = base_size/4,
                                                                   b = base_size/4),
                                            hjust = 0),
      plot.caption = ggplot2::element_text(family=font,
                                           size=base_size,
                                           color="#000000",
                                           margin = ggplot2::margin(t = base_size/1.5,
                                                                    b = base_size/4),
                                           hjust = 0),
      plot.tag = ggplot2::element_text(family=font,
                                       size=base_size,
                                       color="#000000",
                                       margin = ggplot2::margin(t = base_size/4,
                                                                l = base_size/4)),

      # Legend features
      legend.position = "top",
      legend.text.align = 0,
      legend.background = ggplot2::element_blank(),
      legend.title = ggplot2::element_text(family=font,
                                           size=base_size,
                                           color="#000000"),
      legend.key = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(family=font,
                                          size=base_size,
                                          color="#000000"),

      # Axes features
      axis.title.y = ggplot2::element_text(family=font,
                                           size=base_size,
                                           color="#000000",
                                           margin = ggplot2::margin(r = base_size/2),
                                           angle = 90),
      axis.title.x = ggplot2::element_text(family=font,
                                           size=base_size,
                                           color="#000000",
                                           margin = ggplot2::margin(t = base_size/2)),
      axis.text = ggplot2::element_text(family=font,
                                        size=base_size,
                                        color="#000000"),
      axis.text.x = ggplot2::element_text(margin=ggplot2::margin(t = base_size/4)),
      axis.text.y = ggplot2::element_text(margin=ggplot2::margin(r = base_size/4)),
      axis.ticks.x = ggplot2::element_line(color="#000000"),
      axis.ticks.y = ggplot2::element_line(color="#000000"),
      axis.line = ggplot2::element_line(color="#000000"),

      # Grid lines
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.y =  ggplot2::element_line(color="#ebebeb"),
      panel.grid.major.x =  ggplot2::element_line(color="#ebebeb") ,
      panel.background = ggplot2::element_blank(),

      # Facet wrap features
      strip.background = ggplot2::element_rect(fill="white"),
      strip.text = ggplot2::element_text(size  = base_size*1.25,
                                         hjust = 0.5)

    )
  }

}
