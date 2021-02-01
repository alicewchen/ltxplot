library(ggplot2)
library(ltxplot)
load_theme_ltx()
df <- mtcars
df$carb <- as.factor(df$carb)
ggplot(df, aes(x=carb, fill = carb))+
  geom_bar(stat= "count", width=0.7)+
  labs(title = 'Number of cars with different number of carburetors', 
       x = "Number of carburetors", 
       y = "Number of car models",
       tag = 'Figure 1',
       caption = "Data source: mtcars") +
  theme_latex(base_size = 14) +
  theme(legend.position = "none")
