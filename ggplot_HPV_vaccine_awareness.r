# Use source() command to run the preparation code:
source("read_data.r")

# Bar chart for awareness of HPV vaccine
g2 <- ggplot(data=sub_hints_2020,aes(x = age, fill = heardhpvvaccine2))
g2+geom_histogram(position = "fill")+
  theme(legend.position = "bottom")+
  scale_fill_manual(values=c("#809A6F", "#A25B5B", "#DEA057"))+
  labs(title = "Awareness of HPV vaccine ",
       subtitle="Awareness of HPV vaccine among young females could be improved",
       caption = "Source: National Cancer Institute - HINTS 5, Cycle 4 (2020) \n https://hints.cancer.gov/data/download-data.aspx",
      x = "Age", y = "Count", fill = "Awareness of HPV Vaccine")+
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
                                  colour = "#32502E"))

