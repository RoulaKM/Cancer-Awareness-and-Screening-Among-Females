# Use source() command to run the preparation code:
source("read_data.r")

# Bar chart for awareness of HPV causing Oral cancer and education
g6 <- ggplot(data= na.omit(sub_hints_2020),aes(educa))
g6+ geom_bar(fill= "#DEA057")+
  facet_wrap(~hpvcausecancer_oral)+
  coord_flip()+
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  labs(title="Awareness of HPV causing Oral Cancer ")+
  labs(x = "Education Level", y = "Count")  + 
  theme(panel.grid.major = element_line(linetype = "blank"),
        panel.grid.minor = element_line(size = 0.7),
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
  theme(legend.position="none",
        strip.background=element_rect(colour="black",
                                      fill="#e6dbd0"))

CrossTable(sub_hints_2020$educa,sub_hints_2020$hpvcausecancer_oral)
