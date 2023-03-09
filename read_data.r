# Install libraries
install.packages("readstata13")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("ggmosaic")
install.packages("boot")
install.packages("table1")
install.packages("gmodels")

# Call libraries 
library(readstata13)   # for reading the data
library(tidyverse)    # for filtering the data and ggplot2
library(ggmosaic)    # for creating the mosaic graph 
library(boot)
library(table1)     # for creating the descriptive stat in table_1
library(gmodels)    #for the cross table in lung_test
library(vcd)
library(vcdExtra)


# Import data then create a subset that include only females
hints_2020 <- read.dta13("Data/hints5_cycle4_public.dta")

sub_hints_2020 <- hints_2020 %>%
  select(age, birthgender,raceethn5,bmi,smokestat,drinksoneoccasion,
         censreg, pr_ruca_2010, 
         agegrpb, whenpaptest, heardhpv,
         hpvcausecancer_cervical,hpvcausecancer_anal,
         hpvcausecancer_oral,hpvcausecancer_penile, heardhpvvaccine2,
         educa,drtalklungtest, whenpaptest, whenmammogram,
         evertestedcolonca, hhinc)%>%
  filter(complete.cases(age, birthgender,raceethn5,bmi,smokestat,drinksoneoccasion,
                        censreg, pr_ruca_2010, 
                         agegrpb, whenpaptest, heardhpv,
                         hpvcausecancer_cervical,hpvcausecancer_anal,
                         hpvcausecancer_oral,hpvcausecancer_penile ,heardhpvvaccine2,
                        educa, drtalklungtest,whenpaptest,whenmammogram,
                        evertestedcolonca, hhinc))%>%
  filter(birthgender== 2)


# remove negative values
sub_hints_2020[sub_hints_2020 < 0] <- NA

# Change categorical numeric columns to factor

sub_hints_2020$raceethn5<-factor(sub_hints_2020$raceethn5,
                                 labels = c("White","African American","Hispanic",
                                            "Asian","Other"),ordered = T)

sub_hints_2020$smokestat <- factor(sub_hints_2020$smokestat,
                                   labels = c("Current","Former","Never"))

sub_hints_2020$drinksoneoccasion <- factor(sub_hints_2020$drinksoneoccasion,
                                           labels = c("Never", "1 or 2 times",
                                                      "3 to 5 times","6 to 10 times",
                                                      "11 or more times"))

sub_hints_2020$censreg <- factor(sub_hints_2020$censreg,
                                   labels = c("Northeast","Midwest",
                                              "South","West"))

sub_hints_2020$pr_ruca_2010 <- factor(sub_hints_2020$pr_ruca_2010,
                                 labels = c("Metroplitan","Micropolitan",
                                            "Small Town","Rural"))


sub_hints_2020$heardhpvvaccine2 <- factor(sub_hints_2020$heardhpvvaccine2,
                                      labels = c("Yes","No"))

sub_hints_2020$heardhpv <- factor(sub_hints_2020$heardhpv,
                                          labels = c("Yes","No"))


sub_hints_2020$agegrpb <- factor(sub_hints_2020$agegrpb,
                                      labels = c("18-34","35-49",
                                                 "50-64","65-74",
                                                 "75+"))

sub_hints_2020$educa <- factor(sub_hints_2020$educa,
                                 labels = c("Less than High School",
                                            "High School Graduate",
                                            "Some College",
                                            "College Graduate or More"))

sub_hints_2020$drtalklungtest <- factor(sub_hints_2020$drtalklungtest,
                               labels = c("Yes",
                                          "No",
                                          "Don't Know"))

sub_hints_2020$whenpaptest <- factor(sub_hints_2020$whenpaptest,
                                        labels = c("A year ago or less",
                                                   "More than 1, up to 2 years ago",
                                                   "More than 2, up to 3 years ago",
                                                   "More than 3, up to 5 years ago",
                                                   "More than 5 years ago",
                                                   "I have never had a Pap test"))

sub_hints_2020$whenmammogram <- factor(sub_hints_2020$whenmammogram,
                                     labels = c("A year ago or less",
                                                "More than 1, up to 2 years ago",
                                                "More than 2, up to 3 years ago",
                                                "More than 3, up to 5 years ago",
                                                "More than 5 years ago",
                                                "I have never had a mammogram"))

sub_hints_2020$evertestedcolonca <- factor(sub_hints_2020$evertestedcolonca,
                                        labels = c("Yes",
                                                   "No"))

sub_hints_2020$hpvcausecancer_cervical <- factor(sub_hints_2020$hpvcausecancer_cervical,
                                           labels = c("Yes",
                                                      "No",
                                                      "Not sure"))

sub_hints_2020$hpvcausecancer_penile <- factor(sub_hints_2020$hpvcausecancer_penile,
                                                 labels = c("Yes",
                                                            "No",
                                                            "Not sure"))


sub_hints_2020$hpvcausecancer_anal <- factor(sub_hints_2020$hpvcausecancer_anal,
                                               labels = c("Yes",
                                                          "No",
                                                          "Not sure"))

sub_hints_2020$hpvcausecancer_oral <- factor(sub_hints_2020$hpvcausecancer_oral,
                                               labels = c("Yes",
                                                          "No",
                                                          "Not sure"))

sub_hints_2020$hhinc <- factor(sub_hints_2020$hhinc,
                                     labels = c("Less than $20,000",
                                                "$20,000 to < $35,000",
                                                "$35,000 to < $50,000",
                                                "$50,000 to < $75,000",
                                                "$75,000 or More"))
