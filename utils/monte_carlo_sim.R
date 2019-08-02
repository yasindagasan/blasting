mc_sim <-function(atten){
  
  model   = attenuation$bestFitLine # model
  SD      = attenuation$logSD       # log of scaled distances
  
  K       = coef(model)[1]       # get the intercept coefficient
  b       = coef(model)[2]       # get the slope coefficient
  df_sim  = model$df             # residual degrees of freedom
  rse     = summary(model)$sigma # residual standard error
  rse_sim = rse*sqrt(df_sim/rchisq(1,df=df_sim))     # account for the uncertainty in RSE
  y_sim   = rnorm(n=length(SD),mean = K+b*SD,sd=rse) # simulate the PPV values
  lm_sim  = lm(y_sim ~ SD)
  return(coef(lm_sim))
  
}