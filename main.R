#####################################################################
# Scripts to predict the blast induced ground vibrations
#####################################################################
source("utils/attenuationCalculate.R")
source("utils/plotAttenuation.R")

# Import the data
vibrationRecords <- read.csv("dat/vibration records.csv", header = T)

# have a look at the structure of the data and the variables imported
str(vibrationRecords)

# view an individual variable
vibrationRecords$PPV # view PPV data  
vibrationRecords$SD  # view SD data

# calculate the attenuation for the records named "vibrationRecords"
attenuation <- attenuationCalculate(subset(vibrationRecords,Type %in% c("Test"))) 

# plot the attenuation 
plotAttenuation(attenuation, # file with the attenuation calculations
                rangeX =c(20,100), # limits of the plot in x 
                rangeY = c(0.4,20) # limits of the plot in Y
                )

# ---Monte Carlo Simulations (under development)---
simulated_coef <- t(replicate(1000,mc_sim(attenuation)))

# plot the attenuation calculated
plotAttenuation(attenuation, # file with the attenuation calculations
                rangeX =c(20,100), # limits of the plot in x 
                rangeY = c(0.4,20), # limits of the plot in Y
                mc_samples = simulated_coef
)
