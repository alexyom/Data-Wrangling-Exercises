library(dplyr)
library(tidyr)
View(refine_original)
View(refine_original2)
refine_original2$company<-ifelse(refine_original$company=="Phillips","philips",
                            ifelse(refine_original$company=="phillips","philips",
                            ifelse(refine_original$company=="phllips","philips",
                            ifelse(refine_original$company=="phillps","philips",
                            ifelse(refine_original$company=="phillipS","philips",
                            ifelse(refine_original$company=="philips","philips",
                            ifelse(refine_original$company=="akzo","akzo",
                            ifelse(refine_original$company=="Akzo","akzo",
                            ifelse(refine_original$company=="AKZO","akzo",
                            ifelse(refine_original$company=="akz0","akzo",
                            ifelse(refine_original$company=="ak zo","akzo",
                            ifelse(refine_original$company=="fillips","philips",
                            ifelse(refine_original$company=="phlips","philips",
                            ifelse(refine_original$company=="Van Houten","van houten",
                            ifelse(refine_original$company=="van Houten","van houten",
                            ifelse(refine_original$company=="van houten","van houten",
                            ifelse(refine_original$company=="unilver","unilever",
                            ifelse(refine_original$company=="unilever","unilever",
                            ifelse(refine_original$company=="Unilever","unilever",
                                   NA)))))))))))))))))))
refine_original2<-refine_original%>% separate(`Product code / number`,
                            c("product_code","product_number"))
refine_original2$product_category<-ifelse(refine_original2$product_code=="p","Smartphone",
                                  ifelse(refine_original2$product_code=="v","TV",
                                  ifelse(refine_original2$product_code=="x", "Laptop",
                                  ifelse(refine_original2$product_code=="q", "Tablet",
                                         NA))))
refine_original2$full_address<-paste(refine_original2$address,",",
                                refine_original2$city,",",
                                refine_original2$country)
install.packages("mlr")
library(mlr)
refine_original2$company_philips<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
refine_original2$company_akzo<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
refine_original2$company_van_houten<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
refine_original2$company_unilever<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
refine_original2$product_smartphone<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
refine_original2$product_tv<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
refine_original2$product_laptop<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
refine_original2$product_tablet<-data.frame(var=sample(c("0","1"),25,replace=TRUE))
write.csv(refine_original2,"refine_clean.csv")
