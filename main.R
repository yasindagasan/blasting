#####################################################################
# Scripts to predict the blast induced ground vibrations
#####################################################################
source("Functions/attenuationCalculate.R")
source("Functions/plotAttenuation.R")

# Import the data
vibrationRecords <- read.csv("Data/vibration records.csv", header = T)

# have a look at the structure of the data and the variables imported
str(vibrationRecords)

# view an individual variable
vibrationRecords$PPV # view PPV data
vibrationRecords$SD  # view SD data

# calculate the attenuation for the records named "vibrationRecords"
attenuation <- attenuationCalculate(vibrationRecords) 

# plot the attenuation calculated
plotAttenuation(attenuation, # file with the attenuation calculations
                rangeX =c(20,100), # limits of the plot in x 
                rangeY = c(0.4,20) # limits of the plot in Y

                )
# get the statistics about the attenuation of the vibrations
attenuation 
