# Use source() command to run the preparation code:
source("read_data.r")

# change labels in the table
label(sub_hints_2020$age)       <- "Age"
label(sub_hints_2020$bmi)       <- "BMI"
label(sub_hints_2020$smokestat) <- "Smoking"
label(sub_hints_2020$drinksoneoccasion) <- "5 or more drinks on one occasion in the last 30 days"
label(sub_hints_2020$educa)     <- "Education"
label(sub_hints_2020$hhinc)     <- "Household Income"

# change age unit
units(sub_hints_2020$age)       <- "years"

# Create table
table1(~ age+ bmi+ smokestat + drinksoneoccasion+ educa+ hhinc| raceethn5, data= sub_hints_2020,overall = "Total",na.rm=TRUE )

