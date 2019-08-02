attenuationCalculate <- function(records){
  
  logPPVCalc <- log10(records$PPV) 
  logSDCalc  <- log10(records$SD)
  
  minPPVlog <- min(logPPVCalc)
  maxPPVlog <- max(logPPVCalc)  
  minSDlog  <- min(logSDCalc)
  maxSDlog  <- max(logSDCalc)
  
  bestFitLineCalc <- lm(logPPVCalc~logSDCalc)
  
  
  
  kIntercept  <- 10^coefficients(bestFitLineCalc)[1]
  slope       <- coefficients(bestFitLineCalc)[2]
  sumBestFit  <- summary(bestFitLineCalc)
  sigmBestFit <- sumBestFit$sigma
  Kconf95     <- 10^(sigmBestFit*1.645+coefficients(bestFitLineCalc)[1])
  
  return(list(logPPV      = logPPVCalc,
              logSD       = logSDCalc,
              PPV         = records$PPV,
              SD          = records$SD,
              bestFitLine = bestFitLineCalc,
              Intercept   = kIntercept,
              Intercept95 = Kconf95,
              minPPV      = minPPVlog,
              maxPPV      = maxPPVlog,
              minSD       = minSDlog,
              maxSD       = maxSDlog,
              slope       = slope)
         )
  
}
