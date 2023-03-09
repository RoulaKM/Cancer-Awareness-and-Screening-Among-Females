# Use source() command to run the preparation code:
source("read_data.r")

# A division of the sample by Region and (fill) by Commuting Area
g1 <- ggplot(sub_hints_2020, aes(censreg, fill= pr_ruca_2010))
g1 + geom_bar(width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_manual(values=c("#809A6F", "#A25B5B", "#DEA057","#525E75"))+
  labs(title="A Break Down of the Sample by Region and Commuting Area", 
       subtitle="The majority of the data is from the South",
       caption = "Source: National Cancer Institute - HINTS 5, Cycle 4 (2020) \n https://hints.cancer.gov/data/download-data.aspx")+
  labs(x = "Region", y = "Count", fill = "Commuting Area")  + 
  theme(panel.grid.major = element_line(linetype = "blank"),
    panel.grid.minor = element_line(size = 0.5),
    panel.background = element_rect(fill = "#e6dbd0"),
    plot.background = element_rect(fill = "#e6dbd0")) +
  theme(plot.subtitle = element_text(colour = "#584239"),
    plot.caption = element_text(colour = "#584239")) +
  theme(legend.background = element_rect(fill = "#e6dbd0")) +
  theme(axis.ticks = element_line(colour = "gray68"),
    axis.text = element_text(colour = "antiquewhite2"),
    axis.text.x = element_text(colour = "#32502E"),
    axis.text.y = element_text(colour = "#32502E"),
    plot.title = element_text(face = "bold",
        colour = "#32502E"))+
  theme(plot.background = element_rect(colour = NA))
