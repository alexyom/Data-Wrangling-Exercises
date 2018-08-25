states.data<-states
## Exercise: least squares regression
str(states.data)
sem <- subset(states.data, select = c("energy", "metro"))
plot(sem)
states_em <- lm(states.data$energy ~ states.data$metro, states.data)
summary(states_em)
par(mar = c(4, 4, 2, 2), mfrow = c(1, 2))
plot(states_em, which = c(1, 2))
states_emt<-lm(states.data$energy~states.data$metro + states.data$toxic,states.data)
summary(states_emt)
plot(states_emt)
## Exercise: interactions and factors
states_emi <- lm(states.data$energy ~ states.data$metro*states.data$income, states.data)
coef(summary(states_emi))
str(states.data$region)
states.data$region <- factor(states.data$region)
states_reg<-lm(states.data$energy ~ states.data$metro*states.data$income*states.data$region,states.data)
coef(states_reg)