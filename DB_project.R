#######################################################################################
# Author : Nadeesha
# Date : 12/01/2017
# Purpose : DB project - Data cleansing
##########################################################################################

rm(list = ls(all = TRUE))

library(data.table)
library(reshape)
library(stringr)
library(dplyr)
library(tidyr)

# Read the price data to context1
context1 <- fread("price.csv")

summary(context1)

# Make month variables

Dec <- rep(12, nrow(context1))
Jan <- rep(1, nrow(context1))
Feb <- rep(2, nrow(context1))
Mar <- rep(3, nrow(context1))
Apr <- rep(4, nrow(context1))
May <- rep(5, nrow(context1))
Jun <- rep(6, nrow(context1))
Jul <- rep(7, nrow(context1))
Aug <- rep(8, nrow(context1))
Sep <- rep(9, nrow(context1))
Oct <- rep(10, nrow(context1))
Nov <- rep(11, nrow(context1))

# Make year variables

Y2010 <- rep(2010, nrow(context1))
Y2011 <- rep(2011, nrow(context1))
Y2012 <- rep(2012, nrow(context1))
Y2013 <- rep(2013, nrow(context1))
Y2014 <- rep(2014, nrow(context1))
Y2015 <- rep(2015, nrow(context1))
Y2016 <- rep(2016, nrow(context1))
Y2017 <- rep(2017, nrow(context1))

# Make city code variable

city_id <- context1[,1]

# Total rows of new table
13131*(6*12+3)

# create data tables for each month

context2_1 <- data.table(city_code = city_id[1:13131], Year = Y2010[1:13131], Month = Nov[1:13131], Price = context1$`November 2010`)
context2_2 <- data.table(city_code = city_id[1:13131], Year = Y2010[1:13131], Month = Dec[1:13131], Price = context1$`December 2010`)

context2_3 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Jan[1:13131], Price = context1$`January 2011`)
context2_4 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Feb[1:13131], Price = context1$`February 2011`)
context2_5 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Mar[1:13131], Price = context1$`March 2011`)
context2_6 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Apr[1:13131], Price = context1$`April 2011`)
context2_7 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = May[1:13131], Price = context1$`May 2011`)
context2_8 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Jun[1:13131], Price = context1$`June 2011`)
context2_9 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Jul[1:13131], Price = context1$`July 2011`)
context2_10 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Aug[1:13131], Price = context1$`August 2011`)
context2_11 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Sep[1:13131], Price = context1$`September 2011`)
context2_12 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Oct[1:13131], Price = context1$`October 2011`)
context2_13 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Nov[1:13131], Price = context1$`November 2011`)
context2_14 <- data.table(city_code = city_id[1:13131], Year = Y2011[1:13131], Month = Dec[1:13131], Price = context1$`December 2011`)

context2_15 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Jan[1:13131], Price = context1$`January 2012`)
context2_16 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Feb[1:13131], Price = context1$`February 2012`)
context2_17 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Mar[1:13131], Price = context1$`March 2012`)
context2_18 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Apr[1:13131], Price = context1$`April 2012`)
context2_19 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = May[1:13131], Price = context1$`May 2012`)
context2_20 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Jun[1:13131], Price = context1$`June 2012`)
context2_21 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Jul[1:13131], Price = context1$`July 2012`)
context2_22 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Aug[1:13131], Price = context1$`August 2012`)
context2_23 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Sep[1:13131], Price = context1$`September 2012`)
context2_24 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Oct[1:13131], Price = context1$`October 2012`)
context2_25 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Nov[1:13131], Price = context1$`November 2012`)
context2_26 <- data.table(city_code = city_id[1:13131], Year = Y2012[1:13131], Month = Dec[1:13131], Price = context1$`December 2012`)

context2_27 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Jan[1:13131], Price = context1$`January 2013`)
context2_28 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Feb[1:13131], Price = context1$`February 2013`)
context2_29 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Mar[1:13131], Price = context1$`March 2013`)
context2_30 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Apr[1:13131], Price = context1$`April 2013`)
context2_31 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = May[1:13131], Price = context1$`May 2013`)
context2_32 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Jun[1:13131], Price = context1$`June 2013`)
context2_33 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Jul[1:13131], Price = context1$`July 2013`)
context2_34 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Aug[1:13131], Price = context1$`August 2013`)
context2_35 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Sep[1:13131], Price = context1$`September 2013`)
context2_36 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Oct[1:13131], Price = context1$`October 2013`)
context2_37 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Nov[1:13131], Price = context1$`November 2013`)
context2_38 <- data.table(city_code = city_id[1:13131], Year = Y2013[1:13131], Month = Dec[1:13131], Price = context1$`December 2013`)

context2_39 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Jan[1:13131], Price = context1$`January 2014`)
context2_40 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Feb[1:13131], Price = context1$`February 2014`)
context2_41 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Mar[1:13131], Price = context1$`March 2014`)
context2_42 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Apr[1:13131], Price = context1$`April 2014`)
context2_43 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = May[1:13131], Price = context1$`May 2014`)
context2_44 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Jun[1:13131], Price = context1$`June 2014`)
context2_45 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Jul[1:13131], Price = context1$`July 2014`)
context2_46 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Aug[1:13131], Price = context1$`August 2014`)
context2_47 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Sep[1:13131], Price = context1$`September 2014`)
context2_48 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Oct[1:13131], Price = context1$`October 2014`)
context2_49 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Nov[1:13131], Price = context1$`November 2014`)
context2_50 <- data.table(city_code = city_id[1:13131], Year = Y2014[1:13131], Month = Dec[1:13131], Price = context1$`December 2014`)

context2_51 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Jan[1:13131], Price = context1$`January 2015`)
context2_52 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Feb[1:13131], Price = context1$`February 2015`)
context2_53 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Mar[1:13131], Price = context1$`March 2015`)
context2_54 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Apr[1:13131], Price = context1$`April 2015`)
context2_55 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = May[1:13131], Price = context1$`May 2015`)
context2_56 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Jun[1:13131], Price = context1$`June 2015`)
context2_57 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Jul[1:13131], Price = context1$`July 2015`)
context2_58 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Aug[1:13131], Price = context1$`August 2015`)
context2_59 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Sep[1:13131], Price = context1$`September 2015`)
context2_60 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Oct[1:13131], Price = context1$`October 2015`)
context2_61 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Nov[1:13131], Price = context1$`November 2015`)
context2_62 <- data.table(city_code = city_id[1:13131], Year = Y2015[1:13131], Month = Dec[1:13131], Price = context1$`December 2015`)

context2_63 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Jan[1:13131], Price = context1$`January 2016`)
context2_64 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Feb[1:13131], Price = context1$`February 2016`)
context2_65 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Mar[1:13131], Price = context1$`March 2016`)
context2_66 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Apr[1:13131], Price = context1$`April 2016`)
context2_67 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = May[1:13131], Price = context1$`May 2016`)
context2_68 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Jun[1:13131], Price = context1$`June 2016`)
context2_69 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Jul[1:13131], Price = context1$`July 2016`)
context2_70 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Aug[1:13131], Price = context1$`August 2016`)
context2_71 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Sep[1:13131], Price = context1$`September 2016`)
context2_72 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Oct[1:13131], Price = context1$`October 2016`)
context2_73 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Nov[1:13131], Price = context1$`November 2016`)
context2_74 <- data.table(city_code = city_id[1:13131], Year = Y2016[1:13131], Month = Dec[1:13131], Price = context1$`December 2016`)

context2_75 <- data.table(city_code = city_id[1:13131], Year = Y2017[1:13131], Month = Jan[1:13131], Price = context1$`January 2017`)


# Combine all the price data to one table

context2 <- rbind(context2_1, context2_2, context2_3, context2_4, context2_5, context2_6, context2_7, context2_8, context2_9, context2_10,
                  context2_11, context2_12, context2_13, context2_14, context2_15, context2_16, context2_17, context2_18, context2_19, context2_20,
                  context2_21, context2_22, context2_23, context2_24, context2_25, context2_26, context2_27, context2_28, context2_29, context2_30,
                  context2_31, context2_32, context2_33, context2_34, context2_35, context2_36, context2_37, context2_38, context2_39, context2_40,
                  context2_41, context2_42, context2_43, context2_44, context2_45, context2_46, context2_47, context2_48, context2_49, context2_50,
                  context2_51, context2_52, context2_53, context2_54, context2_55, context2_56, context2_57, context2_58, context2_59, context2_60,
                  context2_61, context2_62, context2_63, context2_64, context2_65, context2_66, context2_67, context2_68, context2_69, context2_70,
                  context2_71, context2_72, context2_73, context2_74, context2_75)
                  

context2$name <- paste(context2$`city_code.City Code`, context2$Year, context2$Month, sep = "-")


# View(context2)

# write.csv(context2[,1:4], file = "price_V1.csv", row.names = FALSE)

################################################################################################################################

# Read the pricepersqft data to context3
context3 <- fread("pricepersqft.csv")
str(context3)

city_id2 <- context3[,1]

# create data tables for each month

context4_1 <- data.table(city_code = city_id2[1:11919], Year = Y2010[1:11919], Month = Nov[1:11919], Pricepersqft = context3$`Nov-10`)
context4_2 <- data.table(city_code = city_id2[1:11919], Year = Y2010[1:11919], Month = Dec[1:11919], Pricepersqft = context3$`Dec-10`)

context4_3 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Jan[1:11919], Pricepersqft = context3$`Jan-11`)
context4_4 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Feb[1:11919], Pricepersqft = context3$`Feb-11`)
context4_5 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Mar[1:11919], Pricepersqft = context3$`Mar-11`)
context4_6 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Apr[1:11919], Pricepersqft = context3$`Apr-11`)
context4_7 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = May[1:11919], Pricepersqft = context3$`May-11`)
context4_8 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Jun[1:11919], Pricepersqft = context3$`Jun-11`)
context4_9 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Jul[1:11919], Pricepersqft = context3$`Jul-11`)
context4_10 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Aug[1:11919], Pricepersqft = context3$`Aug-11`)
context4_11 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Sep[1:11919], Pricepersqft = context3$`Sep-11`)
context4_12 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Oct[1:11919], Pricepersqft = context3$`Oct-11`)
context4_13 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Nov[1:11919], Pricepersqft = context3$`Nov-11`)
context4_14 <- data.table(city_code = city_id2[1:11919], Year = Y2011[1:11919], Month = Dec[1:11919], Pricepersqft = context3$`Dec-11`)

context4_15 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Jan[1:11919], Pricepersqft = context3$`Jan-12`)
context4_16 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Feb[1:11919], Pricepersqft = context3$`Feb-12`)
context4_17 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Mar[1:11919], Pricepersqft = context3$`Mar-12`)
context4_18 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Apr[1:11919], Pricepersqft = context3$`Apr-12`)
context4_19 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = May[1:11919], Pricepersqft = context3$`May-12`)
context4_20 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Jun[1:11919], Pricepersqft = context3$`Jun-12`)
context4_21 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Jul[1:11919], Pricepersqft = context3$`Jul-12`)
context4_22 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Aug[1:11919], Pricepersqft = context3$`Aug-12`)
context4_23 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Sep[1:11919], Pricepersqft = context3$`Sep-12`)
context4_24 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Oct[1:11919], Pricepersqft = context3$`Oct-12`)
context4_25 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Nov[1:11919], Pricepersqft = context3$`Nov-12`)
context4_26 <- data.table(city_code = city_id2[1:11919], Year = Y2012[1:11919], Month = Dec[1:11919], Pricepersqft = context3$`Dec-12`)

context4_27 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Jan[1:11919], Pricepersqft = context3$`Jan-13`)
context4_28 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Feb[1:11919], Pricepersqft = context3$`Feb-13`)
context4_29 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Mar[1:11919], Pricepersqft = context3$`Mar-13`)
context4_30 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Apr[1:11919], Pricepersqft = context3$`Apr-13`)
context4_31 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = May[1:11919], Pricepersqft = context3$`May-13`)
context4_32 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Jun[1:11919], Pricepersqft = context3$`Jun-13`)
context4_33 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Jul[1:11919], Pricepersqft = context3$`Jul-13`)
context4_34 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Aug[1:11919], Pricepersqft = context3$`Aug-13`)
context4_35 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Sep[1:11919], Pricepersqft = context3$`Sep-13`)
context4_36 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Oct[1:11919], Pricepersqft = context3$`Oct-13`)
context4_37 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Nov[1:11919], Pricepersqft = context3$`Nov-13`)
context4_38 <- data.table(city_code = city_id2[1:11919], Year = Y2013[1:11919], Month = Dec[1:11919], Pricepersqft = context3$`Dec-13`)

context4_39 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Jan[1:11919], Pricepersqft = context3$`Jan-14`)
context4_40 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Feb[1:11919], Pricepersqft = context3$`Feb-14`)
context4_41 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Mar[1:11919], Pricepersqft = context3$`Mar-14`)
context4_42 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Apr[1:11919], Pricepersqft = context3$`Apr-14`)
context4_43 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = May[1:11919], Pricepersqft = context3$`May-14`)
context4_44 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Jun[1:11919], Pricepersqft = context3$`Jun-14`)
context4_45 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Jul[1:11919], Pricepersqft = context3$`Jul-14`)
context4_46 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Aug[1:11919], Pricepersqft = context3$`Aug-14`)
context4_47 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Sep[1:11919], Pricepersqft = context3$`Sep-14`)
context4_48 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Oct[1:11919], Pricepersqft = context3$`Oct-14`)
context4_49 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Nov[1:11919], Pricepersqft = context3$`Nov-14`)
context4_50 <- data.table(city_code = city_id2[1:11919], Year = Y2014[1:11919], Month = Dec[1:11919], Pricepersqft = context3$`Dec-14`)

context4_51 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Jan[1:11919], Pricepersqft = context3$`Jan-15`)
context4_52 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Feb[1:11919], Pricepersqft = context3$`Feb-15`)
context4_53 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Mar[1:11919], Pricepersqft = context3$`Mar-15`)
context4_54 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Apr[1:11919], Pricepersqft = context3$`Apr-15`)
context4_55 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = May[1:11919], Pricepersqft = context3$`May-15`)
context4_56 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Jun[1:11919], Pricepersqft = context3$`Jun-15`)
context4_57 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Jul[1:11919], Pricepersqft = context3$`Jul-15`)
context4_58 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Aug[1:11919], Pricepersqft = context3$`Aug-15`)
context4_59 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Sep[1:11919], Pricepersqft = context3$`Sep-15`)
context4_60 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Oct[1:11919], Pricepersqft = context3$`Oct-15`)
context4_61 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Nov[1:11919], Pricepersqft = context3$`Nov-15`)
context4_62 <- data.table(city_code = city_id2[1:11919], Year = Y2015[1:11919], Month = Dec[1:11919], Pricepersqft = context3$`Dec-15`)

context4_63 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Jan[1:11919], Pricepersqft = context3$`Jan-16`)
context4_64 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Feb[1:11919], Pricepersqft = context3$`Feb-16`)
context4_65 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Mar[1:11919], Pricepersqft = context3$`Mar-16`)
context4_66 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Apr[1:11919], Pricepersqft = context3$`Apr-16`)
context4_67 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = May[1:11919], Pricepersqft = context3$`May-16`)
context4_68 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Jun[1:11919], Pricepersqft = context3$`Jun-16`)
context4_69 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Jul[1:11919], Pricepersqft = context3$`Jul-16`)
context4_70 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Aug[1:11919], Pricepersqft = context3$`Aug-16`)
context4_71 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Sep[1:11919], Pricepersqft = context3$`Sep-16`)
context4_72 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Oct[1:11919], Pricepersqft = context3$`Oct-16`)
context4_73 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Nov[1:11919], Pricepersqft = context3$`Nov-16`)
context4_74 <- data.table(city_code = city_id2[1:11919], Year = Y2016[1:11919], Month = Dec[1:11919], Pricepersqft = context3$`Dec-16`)

context4_75 <- data.table(city_code = city_id2[1:11919], Year = Y2017[1:11919], Month = Jan[1:11919], Pricepersqft = context3$`Jan-17`)



# Combine all the pricepersqft data to one table

context4 <- rbind(context4_1, context4_2, context4_3, context4_4, context4_5, context4_6, context4_7, context4_8, context4_9, context4_10,
                  context4_11, context4_12, context4_13, context4_14, context4_15, context4_16, context4_17, context4_18, context4_19, context4_20,
                  context4_21, context4_22, context4_23, context4_24, context4_25, context4_26, context4_27, context4_28, context4_29, context4_30,
                  context4_31, context4_32, context4_33, context4_34, context4_35, context4_36, context4_37, context4_38, context4_39, context4_40,
                  context4_41, context4_42, context4_43, context4_44, context4_45, context4_46, context4_47, context4_48, context4_49, context4_50,
                  context4_51, context4_52, context4_53, context4_54, context4_55, context4_56, context4_57, context4_58, context4_59, context4_60,
                  context4_61, context4_62, context4_63, context4_64, context4_65, context4_66, context4_67, context4_68, context4_69, context4_70,
                  context4_71, context4_72, context4_73, context4_74, context4_75)

context4$name <- paste(context4$`city_code.City Code`, context4$Year, context4$Month, sep = "-")

# View(context4)

# Join the price and pricepersqft tables

data <- merge(context2, context4, by = "name", all = TRUE)


head(data)

table(data[, 4])

# Create a csv file of the final table

# write.csv(context4[,1:4], file = "pricepersqft_V1.csv", row.names = FALSE)


##################################################################################################################################



# create table of first 6 columns of price table

context5 <- context1[ , 1:6]
context6 <- context3[ , 1:6]

str(context5)
str(context6)

# merge the data to form new table

context7 <- merge(context5, context6, by = "City Code", all = TRUE)

View(context7)

# Checking if the columns in price and pricepersqft are same

context7$city.diff <- ifelse(context7$City.x == context7$City.y, "Same", "Different")
table(context7$city.diff)

context7$metro.diff <- ifelse(context7$Metro.x == context7$Metro.y, "Same", "Different")
table(context7$metro.diff)

context7$county.diff <- ifelse(context7$County.x == context7$County.y, "Same", "Different")
table(context7$county.diff)

context7$state.diff <- ifelse(context7$State.x == context7$State.y, "Same", "Different")
table(context7$state.diff)

context7$pop.diff <- ifelse(context7$`Population Rank.x` == context7$`Population Rank.y`, "Same", "Different")
table(context7$pop.diff)

# Write the data to a csv file

#write.csv(context7, file = "Location.csv")

# Merge tables based on many factors

context8 <- merge(context5, context6, by = c("City Code", "City", "Metro", "County", "State"), all = TRUE)
context8$pop.diff <- ifelse(context8$`Population Rank.x` == context8$`Population Rank.y`, "Same", "Different")
table(context8$pop.diff)

# View(context8)

#write.csv(context8, file = "Location_V2.csv")


##############################################################################################################
# Prepare csv files required for the data upload
#########################################################################################################


state_1 <- data.table(State_ID = 1:51, State = unique(context8$State))
write.csv(state_1, file = "state.csv", row.names = FALSE)


county_1 <- data.table(County_ID = 1:1231, County = unique(context8$County))
write.csv(county_1, file = "county.csv", row.names = FALSE)

metro_1 <- data.table(Metro_ID = 1:705, Metro = unique(context8$Metro))
write.csv(metro_1, file = "metro.csv", row.names = FALSE)

city_1 <- data.table(City_ID = 1:9712, City = unique(context8$City))
write.csv(city_1, file = "city.csv", row.names = FALSE)

month_1 <- data.table(Month_ID = 1:12, month_name = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))
write.csv(month_1, file = "month.csv", row.names = FALSE)

context8_1 <- merge(context8, state_1, by = "State", all.x = TRUE)
context8_2 <- merge(context8_1, county_1, by = "County", all.x = TRUE)
context8_3 <- merge(context8_2, metro_1, by = "Metro", all.x = TRUE)
context8_4 <- merge(context8_3, city_1, by = "City", all.x = TRUE)
View(context8_4)

context8_final <- data.table(context8_4[,5:7], context8_4[, 9:12])
write.csv(context8_final, file = "city_summary.csv", row.names = FALSE)

before_split <- data.table(data[,1],data[,5],data[,9] )
head(before_split)
after_split_1 <- strsplit(before_split$name, "-")
head(after_split_1)
after_split_2 <- as.data.table(after_split_1)
after_split_3 <- t(after_split_2)
after_split_4 <- data.table(city_code = after_split_3[,1], year = after_split_3[,2], month = after_split_3[,3])

View(after_split_4)

price_summary <- cbind(after_split_4[,], before_split[,2:3])
price_summary$city_code <- as.integer(price_summary$city_code)
price_summary$year <- as.integer(price_summary$year)
price_summary$month <- as.integer(price_summary$month)

View(price_summary)
write.csv(price_summary, file = "price_summary_2.csv", row.names = FALSE)

str(price_summary)

# price_summary$Pricepersqft <- as.character(price_summary$Pricepersqft)

str(city_1)

str(state_1)
