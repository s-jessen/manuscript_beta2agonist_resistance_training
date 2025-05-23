#Colors
upregulated_color = "#c52127"
downregulated_color = "#1178b2"

terbutaline_color = "#C06C84"
resistance_color = "#355C7D"

#Set ggplot theme
theme_set(
  theme(
    panel.background = element_blank(),
    panel.border = element_rect(colour = "black",
                                fill=NA,
                                linewidth = 0.25),
    panel.grid.minor=element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_blank(),
    plot.title = element_text(size = 8,
                              margin = margin(0, 0, 0, 0),
                              hjust = 0),
    axis.line = element_blank(),
    axis.text = element_text(color = "black"),
    axis.title = element_text(size = 8),
    text = element_text(size = 8,
                        color = "black"),
    legend.title = element_blank(),
    legend.key = element_blank(),
    legend.key.size = (unit(3, "mm")),
    legend.position = "right",
    legend.justification = c(0, 1),
    legend.box.just = "left",
    legend.margin = margin(0, 0, -5, 0),
    legend.background = element_blank(),
    legend.box.background = element_blank(),
    title = element_text(size = 6),
    strip.background = element_blank()
  )
)
