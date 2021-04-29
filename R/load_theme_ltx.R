#' @name load_theme_ltx
#' @title Import Latin Modern Roman font and color palette
#' @description This function adds Latin Modern Roman font using \code{sysfonts} and color palette to R options.
#' @keywords load_theme_ltx
#' @import sysfonts
#' @import showtext
#' @export load_theme_ltx
#' @template common_example


# Add Latin Modern Roman font
# This is the default LaTeX font
load_theme_ltx<- function(){
  font_dir <- paste(system.file(package = "ltxplot"),"/extdata/fonts/", sep ="")
  sysfonts::font_paths(font_dir)

  if (!requireNamespace(c("sysfonts","showtext"), quietly = TRUE)) {
    stop("Package \"showtext\" needed to install custom font. Please install it.",
         call. = FALSE)
  } else {
    sysfonts::font_add(family = "lmroman",
                       regular = paste(font_dir, "NewCM10-Regular.otf", sep = ""),
                       bold = paste(font_dir, "NewCM10-Bold.otf", sep = ""),
                       italic = paste(font_dir, "NewCM10-Italic.otf", sep = ""),
                       bolditalic = paste(font_dir, "NewCM10-BoldItalic.otf", sep = ""))
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
