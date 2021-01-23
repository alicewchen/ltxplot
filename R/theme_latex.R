# Add Latin Modern Roman font
# This is the default LaTeX font
if (!requireNamespace("showtext", quietly = TRUE)) {
  stop("Package \"showtext\" needed to install custom font. Please install it.",
       call. = FALSE)
} else {
  sysfonts::font_add(family = "lmroman",
           regular = "../LTXplot/fonts/lmroman10-regular-webfont.ttf",
           bold = "../LTXplot/fonts/lmromandemi10-regular-webfont.ttf",
           italic = "../LTXplot/fonts/lmroman10-italic-webfont.ttf",
           bolditalic = "../LTXplot/fonts/lmroman10-bolditalic-webfont.ttf")
  showtext::showtext_auto()
}

# Set global custom colorblind-friendly palette

opts <- options(
  ggplot2.discrete.fill = list(
    c("#D55E00", "#0072B2"),
    c("#D55E00", "#0072B2","#009E73", "#F0E442"),
    c("#E69F00", "#56B4E9", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
    )
)



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