# Use source() command to run the preparation code:
source("read_data.r")

# Mosaic plot- most recent pap test and age group
g7 <- ggplot(data = na.omit(sub_hints_2020))
g7 + geom_mosaic(aes(x = product(whenpaptest), conds = product(agegrpb), fill = whenpaptest))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_manual(values=c("#809A6F", "#A25B5B", "#DEA057","#525E75","#7C3E66","#2F8F9D"))+
  labs(title="Most Recent Pap Test Against Age Group",
       subtitle="Only a Small Percentage Have Never had a Pap Test",
       caption = "Source: National Cancer Institute - HINTS 5, Cycle 4 (2020) \n https://hints.cancer.gov/data/download-data.aspx")+
  labs(x = "Age Group", y = "Most Recent Pap Test",fill = "Most Recent Pap Test")  + 
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
                                  colour = "#32502E")) +
  theme(legend.position = "left")

# Mosaic plot- most recent pap test and house hold income
g7 + geom_mosaic(aes(x = product(whenpaptest), conds = product(hhinc), fill = whenpaptest))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_manual(values=c("#809A6F", "#A25B5B", "#DEA057","#525E75","#7C3E66","#2F8F9D"))+
  labs(title="Most Recent Pap Test Against House Hold Income",
       subtitle="The Lowest House Hold Income Has the Highest 'Have Never Had a Pap Test'",
       caption = "Source: National Cancer Institute - HINTS 5, Cycle 4 (2020) \n https://hints.cancer.gov/data/download-data.aspx")+
  labs(x = "House Hold Income", y = "Most Recent Pap Test",fill = "Most Recent Pap Test")  + 
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
                                  colour = "#32502E")) +
  theme(legend.position = "none")
