library("dummies")
library("RPostgreSQL")
library("rjson")
library("jsonlite")
library("RCurl")
library("dplyr")
library("rlist")
library("RJSONIO")
library("data.tree")
library("magrittr")
library("RMySQL")
library("dbConnect")
library("RODBC")

drv <- dbDriver("MySQL")

con <- dbConnect(drv,
                 dbname = "dda_live_bkp",
                 port = 3306,
                 host = "192.168.8.200",
                 user="itusers",
                 password ="rms@123")

print("connected")

#kerala 
json_file1 <- "https://nrrkl.salesdiary.in:4005/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata <- jsonlite::fromJSON(json_file1)
newdata <- data.frame(state = unlist(newdata[["result"]][[1]]),
                      emp_code = unlist(newdata[["result"]][[2]]),
                      salesman = unlist(newdata[["result"]][[3]]),
                      mobile = unlist(newdata[["result"]][[4]]),
                      role_name = unlist(newdata[["result"]][[5]]),
                      order_date = unlist(newdata[["result"]][[6]]),
                      area_name = unlist(newdata[["result"]][[7]]),
                      zone_name = unlist(newdata[["result"]][[8]]),
                      territory_name = unlist(newdata[["result"]][[9]]),
                      beat_name = unlist(newdata[["result"]][[10]]),
                      beat_type = unlist(newdata[["result"]][[11]]),
                      distributor_name = unlist(newdata[["result"]][[12]]),
                      distributor_code = unlist(newdata[["result"]][[13]]),
                      outlet_name = unlist(newdata[["result"]][[14]]),
                      outletid = unlist(newdata[["result"]][[15]]),
                      prod_name = unlist(newdata[["result"]][[16]]),
                      prod_code = unlist(newdata[["result"]][[17]]),
                      outlet_type = unlist(newdata[["result"]][[18]]),
                      categ_name = unlist(newdata[["result"]][[19]]),
                      brand_name = unlist(newdata[["result"]][[20]]),
                      qty_sales = unlist(newdata[["result"]][[21]]),
                      line_type = unlist(newdata[["result"]][[22]]),
                      is_mss = unlist(newdata[["result"]][[23]]),
                      is_focus = unlist(newdata[["result"]][[24]]),
                      is_unscheduled = unlist(newdata[["result"]][[25]]),
                      total_sales = unlist(newdata[["result"]][[26]]),
                      stringsAsFactors = FALSE)

#newdata
#delhi 
json_file2 <- "https://nrrdl.salesdiary.in:4012/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata1 <- jsonlite::fromJSON(json_file2)
newdata1 <- data.frame(state = unlist(newdata1[["result"]][[1]]),
                       emp_code = unlist(newdata1[["result"]][[2]]),
                       salesman = unlist(newdata1[["result"]][[3]]),
                       mobile = unlist(newdata1[["result"]][[4]]),
                       role_name = unlist(newdata1[["result"]][[5]]),
                       order_date = unlist(newdata1[["result"]][[6]]),
                       area_name = unlist(newdata1[["result"]][[7]]),
                       zone_name = unlist(newdata1[["result"]][[8]]),
                       territory_name = unlist(newdata1[["result"]][[9]]),
                       beat_name = unlist(newdata1[["result"]][[10]]),
                       beat_type = unlist(newdata1[["result"]][[11]]),
                       distributor_name = unlist(newdata1[["result"]][[12]]),
                       distributor_code = unlist(newdata1[["result"]][[13]]),
                       outlet_name = unlist(newdata1[["result"]][[14]]),
                       outletid = unlist(newdata1[["result"]][[15]]),
                       prod_name = unlist(newdata1[["result"]][[16]]),
                       prod_code = unlist(newdata1[["result"]][[17]]),
                       outlet_type = unlist(newdata1[["result"]][[18]]),
                       categ_name = unlist(newdata1[["result"]][[19]]),
                       brand_name = unlist(newdata1[["result"]][[20]]),
                       qty_sales = unlist(newdata1[["result"]][[21]]),
                       line_type = unlist(newdata1[["result"]][[22]]),
                       is_mss = unlist(newdata1[["result"]][[23]]),
                       is_focus = unlist(newdata1[["result"]][[24]]),
                       is_unscheduled = unlist(newdata1[["result"]][[25]]),
                       total_sales = unlist(newdata1[["result"]][[26]]),
                       stringsAsFactors = FALSE)

# newdata1
nd1<- rbind(newdata, newdata1)
#karnataka 
json_file3 <- "https://nrrka.salesdiary.in:4004/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata2 <- jsonlite::fromJSON(json_file3)
newdata2 <- data.frame(state = unlist(newdata2[["result"]][[1]]),
                       emp_code = unlist(newdata2[["result"]][[2]]),
                       salesman = unlist(newdata2[["result"]][[3]]),
                       mobile = unlist(newdata2[["result"]][[4]]),
                       role_name = unlist(newdata2[["result"]][[5]]),
                       order_date = unlist(newdata2[["result"]][[6]]),
                       area_name = unlist(newdata2[["result"]][[7]]),
                       zone_name = unlist(newdata2[["result"]][[8]]),
                       territory_name = unlist(newdata2[["result"]][[9]]),
                       beat_name = unlist(newdata2[["result"]][[10]]),
                       beat_type = unlist(newdata2[["result"]][[11]]),
                       distributor_name = unlist(newdata2[["result"]][[12]]),
                       distributor_code = unlist(newdata2[["result"]][[13]]),
                       outlet_name = unlist(newdata2[["result"]][[14]]),
                       outletid = unlist(newdata2[["result"]][[15]]),
                       prod_name = unlist(newdata2[["result"]][[16]]),
                       prod_code = unlist(newdata2[["result"]][[17]]),
                       outlet_type = unlist(newdata2[["result"]][[18]]),
                       categ_name = unlist(newdata2[["result"]][[19]]),
                       brand_name = unlist(newdata2[["result"]][[20]]),
                       qty_sales = unlist(newdata2[["result"]][[21]]),
                       line_type = unlist(newdata2[["result"]][[22]]),
                       is_mss = unlist(newdata2[["result"]][[23]]),
                       is_focus = unlist(newdata2[["result"]][[24]]),
                       is_unscheduled = unlist(newdata2[["result"]][[25]]),
                       total_sales = unlist(newdata2[["result"]][[26]]),
                       stringsAsFactors = FALSE)

# newdata2
nd2<- rbind(nd1, newdata2)
#tamilnadu
json_file4 <- "https://nrrtn.salesdiary.in:4006/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata3 <- jsonlite::fromJSON(json_file3)
newdata3 <- data.frame(state = unlist(newdata3[["result"]][[1]]),
                       emp_code = unlist(newdata3[["result"]][[2]]),
                       salesman = unlist(newdata3[["result"]][[3]]),
                       mobile = unlist(newdata3[["result"]][[4]]),
                       role_name = unlist(newdata3[["result"]][[5]]),
                       order_date = unlist(newdata3[["result"]][[6]]),
                       area_name = unlist(newdata3[["result"]][[7]]),
                       zone_name = unlist(newdata3[["result"]][[8]]),
                       territory_name = unlist(newdata3[["result"]][[9]]),
                       beat_name = unlist(newdata3[["result"]][[10]]),
                       beat_type = unlist(newdata3[["result"]][[11]]),
                       distributor_name = unlist(newdata3[["result"]][[12]]),
                       distributor_code = unlist(newdata3[["result"]][[13]]),
                       outlet_name = unlist(newdata3[["result"]][[14]]),
                       outletid = unlist(newdata3[["result"]][[15]]),
                       prod_name = unlist(newdata3[["result"]][[16]]),
                       prod_code = unlist(newdata3[["result"]][[17]]),
                       outlet_type = unlist(newdata3[["result"]][[18]]),
                       categ_name = unlist(newdata3[["result"]][[19]]),
                       brand_name = unlist(newdata3[["result"]][[20]]),
                       qty_sales = unlist(newdata3[["result"]][[21]]),
                       line_type = unlist(newdata3[["result"]][[22]]),
                       is_mss = unlist(newdata3[["result"]][[23]]),
                       is_focus = unlist(newdata3[["result"]][[24]]),
                       is_unscheduled = unlist(newdata3[["result"]][[25]]),
                       total_sales = unlist(newdata3[["result"]][[26]]),
                       stringsAsFactors = FALSE)

# newdata3
nd3<-rbind(nd2, newdata3)
#andhra pradesh
json_file5 <- "https://nrrap.salesdiary.in:4007/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata4 <- jsonlite::fromJSON(json_file5)
newdata4 <- data.frame(state = unlist(newdata4[["result"]][[1]]),
                       emp_code = unlist(newdata4[["result"]][[2]]),
                       salesman = unlist(newdata4[["result"]][[3]]),
                       mobile = unlist(newdata4[["result"]][[4]]),
                       role_name = unlist(newdata4[["result"]][[5]]),
                       order_date = unlist(newdata4[["result"]][[6]]),
                       area_name = unlist(newdata4[["result"]][[7]]),
                       zone_name = unlist(newdata4[["result"]][[8]]),
                       territory_name = unlist(newdata4[["result"]][[9]]),
                       beat_name = unlist(newdata4[["result"]][[10]]),
                       beat_type = unlist(newdata4[["result"]][[11]]),
                       distributor_name = unlist(newdata4[["result"]][[12]]),
                       distributor_code = unlist(newdata4[["result"]][[13]]),
                       outlet_name = unlist(newdata4[["result"]][[14]]),
                       outletid = unlist(newdata4[["result"]][[15]]),
                       prod_name = unlist(newdata4[["result"]][[16]]),
                       prod_code = unlist(newdata4[["result"]][[17]]),
                       outlet_type = unlist(newdata4[["result"]][[18]]),
                       categ_name = unlist(newdata4[["result"]][[19]]),
                       brand_name = unlist(newdata4[["result"]][[20]]),
                       qty_sales = unlist(newdata4[["result"]][[21]]),
                       line_type = unlist(newdata4[["result"]][[22]]),
                       is_mss = unlist(newdata4[["result"]][[23]]),
                       is_focus = unlist(newdata4[["result"]][[24]]),
                       is_unscheduled = unlist(newdata4[["result"]][[25]]),
                       total_sales = unlist(newdata4[["result"]][[26]]),
                       stringsAsFactors = FALSE)
# newdata4
nd4<- rbind(nd3, newdata4)
#might be maharashtra 
json_file6 <- "https://nrrmb.salesdiary.in:4008/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata5 <- jsonlite::fromJSON(json_file6)
newdata5 <- data.frame(state = unlist(newdata5[["result"]][[1]]),
                       emp_code = unlist(newdata5[["result"]][[2]]),
                       salesman = unlist(newdata5[["result"]][[3]]),
                       mobile = unlist(newdata5[["result"]][[4]]),
                       role_name = unlist(newdata5[["result"]][[5]]),
                       order_date = unlist(newdata5[["result"]][[6]]),
                       area_name = unlist(newdata5[["result"]][[7]]),
                       zone_name = unlist(newdata5[["result"]][[8]]),
                       territory_name = unlist(newdata5[["result"]][[9]]),
                       beat_name = unlist(newdata5[["result"]][[10]]),
                       beat_type = unlist(newdata5[["result"]][[11]]),
                       distributor_name = unlist(newdata5[["result"]][[12]]),
                       distributor_code = unlist(newdata5[["result"]][[13]]),
                       outlet_name = unlist(newdata5[["result"]][[14]]),
                       outletid = unlist(newdata5[["result"]][[15]]),
                       prod_name = unlist(newdata5[["result"]][[16]]),
                       prod_code = unlist(newdata5[["result"]][[17]]),
                       outlet_type = unlist(newdata5[["result"]][[18]]),
                       categ_name = unlist(newdata5[["result"]][[19]]),
                       brand_name = unlist(newdata5[["result"]][[20]]),
                       qty_sales = unlist(newdata5[["result"]][[21]]),
                       line_type = unlist(newdata5[["result"]][[22]]),
                       is_mss = unlist(newdata5[["result"]][[23]]),
                       is_focus = unlist(newdata5[["result"]][[24]]),
                       is_unscheduled = unlist(newdata5[["result"]][[25]]),
                       total_sales = unlist(newdata5[["result"]][[26]]),
                       stringsAsFactors = FALSE)
# newdata5
nd5<-rbind(nd4, newdata5)
#maharashtra 
json_file7 <- "https://nrrmh.salesdiary.in:4009/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata6 <- jsonlite::fromJSON(json_file7)
newdata6 <- data.frame(state = unlist(newdata6[["result"]][[1]]),
                       emp_code = unlist(newdata6[["result"]][[2]]),
                       salesman = unlist(newdata6[["result"]][[3]]),
                       mobile = unlist(newdata6[["result"]][[4]]),
                       role_name = unlist(newdata6[["result"]][[5]]),
                       order_date = unlist(newdata6[["result"]][[6]]),
                       area_name = unlist(newdata6[["result"]][[7]]),
                       zone_name = unlist(newdata6[["result"]][[8]]),
                       territory_name = unlist(newdata6[["result"]][[9]]),
                       beat_name = unlist(newdata6[["result"]][[10]]),
                       beat_type = unlist(newdata6[["result"]][[11]]),
                       distributor_name = unlist(newdata6[["result"]][[12]]),
                       distributor_code = unlist(newdata6[["result"]][[13]]),
                       outlet_name = unlist(newdata6[["result"]][[14]]),
                       outletid = unlist(newdata6[["result"]][[15]]),
                       prod_name = unlist(newdata6[["result"]][[16]]),
                       prod_code = unlist(newdata6[["result"]][[17]]),
                       outlet_type = unlist(newdata6[["result"]][[18]]),
                       categ_name = unlist(newdata6[["result"]][[19]]),
                       brand_name = unlist(newdata6[["result"]][[20]]),
                       qty_sales = unlist(newdata6[["result"]][[21]]),
                       line_type = unlist(newdata6[["result"]][[22]]),
                       is_mss = unlist(newdata6[["result"]][[23]]),
                       is_focus = unlist(newdata6[["result"]][[24]]),
                       is_unscheduled = unlist(newdata6[["result"]][[25]]),
                       total_sales = unlist(newdata6[["result"]][[26]]),
                       stringsAsFactors = FALSE)
# newdata6
nd6<- rbind(nd5, newdata6)
#westbengal 
json_file8 <- "https://nrrwb.salesdiary.in:4011/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata7 <- jsonlite::fromJSON(json_file8)
newdata7 <- data.frame(state = unlist(newdata7[["result"]][[1]]),
                       emp_code = unlist(newdata7[["result"]][[2]]),
                       salesman = unlist(newdata7[["result"]][[3]]),
                       mobile = unlist(newdata7[["result"]][[4]]),
                       role_name = unlist(newdata7[["result"]][[5]]),
                       order_date = unlist(newdata7[["result"]][[6]]),
                       area_name = unlist(newdata7[["result"]][[7]]),
                       zone_name = unlist(newdata7[["result"]][[8]]),
                       territory_name = unlist(newdata7[["result"]][[9]]),
                       beat_name = unlist(newdata7[["result"]][[10]]),
                       beat_type = unlist(newdata7[["result"]][[11]]),
                       distributor_name = unlist(newdata7[["result"]][[12]]),
                       distributor_code = unlist(newdata7[["result"]][[13]]),
                       outlet_name = unlist(newdata7[["result"]][[14]]),
                       outletid = unlist(newdata7[["result"]][[15]]),
                       prod_name = unlist(newdata7[["result"]][[16]]),
                       prod_code = unlist(newdata7[["result"]][[17]]),
                       outlet_type = unlist(newdata7[["result"]][[18]]),
                       categ_name = unlist(newdata7[["result"]][[19]]),
                       brand_name = unlist(newdata7[["result"]][[20]]),
                       qty_sales = unlist(newdata7[["result"]][[21]]),
                       line_type = unlist(newdata7[["result"]][[22]]),
                       is_mss = unlist(newdata7[["result"]][[23]]),
                       is_focus = unlist(newdata7[["result"]][[24]]),
                       is_unscheduled = unlist(newdata7[["result"]][[25]]),
                       total_sales = unlist(newdata7[["result"]][[26]]),
                       stringsAsFactors = FALSE)
# newdata7
nd7<- rbind(nd6, newdata7)
#uttarpradesh 
json_file9 <- "https://nrrup.salesdiary.in:4011/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata8 <- jsonlite::fromJSON(json_file9)
newdata8 <- data.frame(state = unlist(newdata8[["result"]][[1]]),
                       emp_code = unlist(newdata8[["result"]][[2]]),
                       salesman = unlist(newdata8[["result"]][[3]]),
                       mobile = unlist(newdata8[["result"]][[4]]),
                       role_name = unlist(newdata8[["result"]][[5]]),
                       order_date = unlist(newdata8[["result"]][[6]]),
                       area_name = unlist(newdata8[["result"]][[7]]),
                       zone_name = unlist(newdata8[["result"]][[8]]),
                       territory_name = unlist(newdata8[["result"]][[9]]),
                       beat_name = unlist(newdata8[["result"]][[10]]),
                       beat_type = unlist(newdata8[["result"]][[11]]),
                       distributor_name = unlist(newdata8[["result"]][[12]]),
                       distributor_code = unlist(newdata8[["result"]][[13]]),
                       outlet_name = unlist(newdata8[["result"]][[14]]),
                       outletid = unlist(newdata8[["result"]][[15]]),
                       prod_name = unlist(newdata8[["result"]][[16]]),
                       prod_code = unlist(newdata8[["result"]][[17]]),
                       outlet_type = unlist(newdata8[["result"]][[18]]),
                       categ_name = unlist(newdata8[["result"]][[19]]),
                       brand_name = unlist(newdata8[["result"]][[20]]),
                       qty_sales = unlist(newdata8[["result"]][[21]]),
                       line_type = unlist(newdata8[["result"]][[22]]),
                       is_mss = unlist(newdata8[["result"]][[23]]),
                       is_focus = unlist(newdata8[["result"]][[24]]),
                       is_unscheduled = unlist(newdata8[["result"]][[25]]),
                       total_sales = unlist(newdata8[["result"]][[26]]),
                       stringsAsFactors = FALSE)
# newdata8
nd8<- rbind(nd7, newdata8)
#RAJASTHAN
json_file10 <- "https://nrrrj.salesdiary.in:4016/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata9 <- jsonlite::fromJSON(json_file10)
newdata9 <- data.frame(state = unlist(newdata9[["result"]][[1]]),
                       emp_code = unlist(newdata9[["result"]][[2]]),
                       salesman = unlist(newdata9[["result"]][[3]]),
                       mobile = unlist(newdata9[["result"]][[4]]),
                       role_name = unlist(newdata9[["result"]][[5]]),
                       order_date = unlist(newdata9[["result"]][[6]]),
                       area_name = unlist(newdata9[["result"]][[7]]),
                       zone_name = unlist(newdata9[["result"]][[8]]),
                       territory_name = unlist(newdata9[["result"]][[9]]),
                       beat_name = unlist(newdata9[["result"]][[10]]),
                       beat_type = unlist(newdata9[["result"]][[11]]),
                       distributor_name = unlist(newdata9[["result"]][[12]]),
                       distributor_code = unlist(newdata9[["result"]][[13]]),
                       outlet_name = unlist(newdata9[["result"]][[14]]),
                       outletid = unlist(newdata9[["result"]][[15]]),
                       prod_name = unlist(newdata9[["result"]][[16]]),
                       prod_code = unlist(newdata9[["result"]][[17]]),
                       outlet_type = unlist(newdata9[["result"]][[18]]),
                       categ_name = unlist(newdata9[["result"]][[19]]),
                       brand_name = unlist(newdata9[["result"]][[20]]),
                       qty_sales = unlist(newdata9[["result"]][[21]]),
                       line_type = unlist(newdata9[["result"]][[22]]),
                       is_mss = unlist(newdata9[["result"]][[23]]),
                       is_focus = unlist(newdata9[["result"]][[24]]),
                       is_unscheduled = unlist(newdata9[["result"]][[25]]),
                       total_sales = unlist(newdata9[["result"]][[26]]),
                       stringsAsFactors = FALSE)

# newdata9
nd9<- rbind(nd8, newdata9)
#punjab
json_file11 <- "https://nrrpb.salesdiary.in:4017/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata10 <- jsonlite::fromJSON(json_file11)
newdata10 <- data.frame(state = unlist(newdata10[["result"]][[1]]),
                        emp_code = unlist(newdata10[["result"]][[2]]),
                        salesman = unlist(newdata10[["result"]][[3]]),
                        mobile = unlist(newdata10[["result"]][[4]]),
                        role_name = unlist(newdata10[["result"]][[5]]),
                        order_date = unlist(newdata10[["result"]][[6]]),
                        area_name = unlist(newdata10[["result"]][[7]]),
                        zone_name = unlist(newdata10[["result"]][[8]]),
                        territory_name = unlist(newdata10[["result"]][[9]]),
                        beat_name = unlist(newdata10[["result"]][[10]]),
                        beat_type = unlist(newdata10[["result"]][[11]]),
                        distributor_name = unlist(newdata10[["result"]][[12]]),
                        distributor_code = unlist(newdata10[["result"]][[13]]),
                        outlet_name = unlist(newdata10[["result"]][[14]]),
                        outletid = unlist(newdata10[["result"]][[15]]),
                        prod_name = unlist(newdata10[["result"]][[16]]),
                        prod_code = unlist(newdata10[["result"]][[17]]),
                        outlet_type = unlist(newdata10[["result"]][[18]]),
                        categ_name = unlist(newdata10[["result"]][[19]]),
                        brand_name = unlist(newdata10[["result"]][[20]]),
                        qty_sales = unlist(newdata10[["result"]][[21]]),
                        line_type = unlist(newdata10[["result"]][[22]]),
                        is_mss = unlist(newdata10[["result"]][[23]]),
                        is_focus = unlist(newdata10[["result"]][[24]]),
                        is_unscheduled = unlist(newdata10[["result"]][[25]]),
                        total_sales = unlist(newdata10[["result"]][[26]]),
                        stringsAsFactors = FALSE)
# newdata10
nd10<- rbind(nd9, newdata10)
#gujarat 
json_file12 <- "https://nrrgj.salesdiary.in:4010/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata11 <- jsonlite::fromJSON(json_file12)
newdata11 <- data.frame(state = unlist(newdata11[["result"]][[1]]),
                        emp_code = unlist(newdata11[["result"]][[2]]),
                        salesman = unlist(newdata11[["result"]][[3]]),
                        mobile = unlist(newdata11[["result"]][[4]]),
                        role_name = unlist(newdata11[["result"]][[5]]),
                        order_date = unlist(newdata11[["result"]][[6]]),
                        area_name = unlist(newdata11[["result"]][[7]]),
                        zone_name = unlist(newdata11[["result"]][[8]]),
                        territory_name = unlist(newdata11[["result"]][[9]]),
                        beat_name = unlist(newdata11[["result"]][[10]]),
                        beat_type = unlist(newdata11[["result"]][[11]]),
                        distributor_name = unlist(newdata11[["result"]][[12]]),
                        distributor_code = unlist(newdata11[["result"]][[13]]),
                        outlet_name = unlist(newdata11[["result"]][[14]]),
                        outletid = unlist(newdata11[["result"]][[15]]),
                        prod_name = unlist(newdata11[["result"]][[16]]),
                        prod_code = unlist(newdata11[["result"]][[17]]),
                        outlet_type = unlist(newdata11[["result"]][[18]]),
                        categ_name = unlist(newdata11[["result"]][[19]]),
                        brand_name = unlist(newdata11[["result"]][[20]]),
                        qty_sales = unlist(newdata11[["result"]][[21]]),
                        line_type = unlist(newdata11[["result"]][[22]]),
                        is_mss = unlist(newdata11[["result"]][[23]]),
                        is_focus = unlist(newdata11[["result"]][[24]]),
                        is_unscheduled = unlist(newdata11[["result"]][[25]]),
                        total_sales = unlist(newdata11[["result"]][[26]]),
                        stringsAsFactors = FALSE)
# newdata11
nd11<- rbind(nd10, newdata11)
#bihar
json_file13 <- "https://nrrbr.salesdiary.in:4013/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata12 <- jsonlite::fromJSON(json_file13)
newdata12 <- data.frame(state = unlist(newdata12[["result"]][[1]]),
                        emp_code = unlist(newdata12[["result"]][[2]]),
                        salesman = unlist(newdata12[["result"]][[3]]),
                        mobile = unlist(newdata12[["result"]][[4]]),
                        role_name = unlist(newdata12[["result"]][[5]]),
                        order_date = unlist(newdata12[["result"]][[6]]),
                        area_name = unlist(newdata12[["result"]][[7]]),
                        zone_name = unlist(newdata12[["result"]][[8]]),
                        territory_name = unlist(newdata12[["result"]][[9]]),
                        beat_name = unlist(newdata12[["result"]][[10]]),
                        beat_type = unlist(newdata12[["result"]][[11]]),
                        distributor_name = unlist(newdata12[["result"]][[12]]),
                        distributor_code = unlist(newdata12[["result"]][[13]]),
                        outlet_name = unlist(newdata12[["result"]][[14]]),
                        outletid = unlist(newdata12[["result"]][[15]]),
                        prod_name = unlist(newdata12[["result"]][[16]]),
                        prod_code = unlist(newdata12[["result"]][[17]]),
                        outlet_type = unlist(newdata12[["result"]][[18]]),
                        categ_name = unlist(newdata12[["result"]][[19]]),
                        brand_name = unlist(newdata12[["result"]][[20]]),
                        qty_sales = unlist(newdata12[["result"]][[21]]),
                        line_type = unlist(newdata12[["result"]][[22]]),
                        is_mss = unlist(newdata12[["result"]][[23]]),
                        is_focus = unlist(newdata12[["result"]][[24]]),
                        is_unscheduled = unlist(newdata12[["result"]][[25]]),
                        total_sales = unlist(newdata12[["result"]][[26]]),
                        stringsAsFactors = FALSE)
# newdata12
nd12<- rbind(nd11, newdata12)
#northeast
json_file14 <- "https://nrrne.salesdiary.in:4001/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata13 <- jsonlite::fromJSON(json_file13)
newdata13 <- data.frame(state = unlist(newdata13[["result"]][[1]]),
                        emp_code = unlist(newdata13[["result"]][[2]]),
                        salesman = unlist(newdata13[["result"]][[3]]),
                        mobile = unlist(newdata13[["result"]][[4]]),
                        role_name = unlist(newdata13[["result"]][[5]]),
                        order_date = unlist(newdata13[["result"]][[6]]),
                        area_name = unlist(newdata13[["result"]][[7]]),
                        zone_name = unlist(newdata13[["result"]][[8]]),
                        territory_name = unlist(newdata13[["result"]][[9]]),
                        beat_name = unlist(newdata13[["result"]][[10]]),
                        beat_type = unlist(newdata13[["result"]][[11]]),
                        distributor_name = unlist(newdata13[["result"]][[12]]),
                        distributor_code = unlist(newdata13[["result"]][[13]]),
                        outlet_name = unlist(newdata13[["result"]][[14]]),
                        outletid = unlist(newdata13[["result"]][[15]]),
                        prod_name = unlist(newdata13[["result"]][[16]]),
                        prod_code = unlist(newdata13[["result"]][[17]]),
                        outlet_type = unlist(newdata13[["result"]][[18]]),
                        categ_name = unlist(newdata13[["result"]][[19]]),
                        brand_name = unlist(newdata13[["result"]][[20]]),
                        qty_sales = unlist(newdata13[["result"]][[21]]),
                        line_type = unlist(newdata13[["result"]][[22]]),
                        is_mss = unlist(newdata13[["result"]][[23]]),
                        is_focus = unlist(newdata13[["result"]][[24]]),
                        is_unscheduled = unlist(newdata13[["result"]][[25]]),
                        total_sales = unlist(newdata13[["result"]][[26]]),
                        stringsAsFactors = FALSE)


nd13<- rbind(nd12, newdata13)
#orissa 
json_file15<- "https://nrror.salesdiary.in:4002/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata14 <- jsonlite::fromJSON(json_file13)
newdata14 <- data.frame(state = unlist(newdata14[["result"]][[1]]),
                        emp_code = unlist(newdata14[["result"]][[2]]),
                        salesman = unlist(newdata14[["result"]][[3]]),
                        mobile = unlist(newdata14[["result"]][[4]]),
                        role_name = unlist(newdata14[["result"]][[5]]),
                        order_date = unlist(newdata14[["result"]][[6]]),
                        area_name = unlist(newdata14[["result"]][[7]]),
                        zone_name = unlist(newdata14[["result"]][[8]]),
                        territory_name = unlist(newdata14[["result"]][[9]]),
                        beat_name = unlist(newdata14[["result"]][[10]]),
                        beat_type = unlist(newdata14[["result"]][[11]]),
                        distributor_name = unlist(newdata14[["result"]][[12]]),
                        distributor_code = unlist(newdata14[["result"]][[13]]),
                        outlet_name = unlist(newdata14[["result"]][[14]]),
                        outletid = unlist(newdata14[["result"]][[15]]),
                        prod_name = unlist(newdata14[["result"]][[16]]),
                        prod_code = unlist(newdata14[["result"]][[17]]),
                        outlet_type = unlist(newdata14[["result"]][[18]]),
                        categ_name = unlist(newdata14[["result"]][[19]]),
                        brand_name = unlist(newdata14[["result"]][[20]]),
                        qty_sales = unlist(newdata14[["result"]][[21]]),
                        line_type = unlist(newdata14[["result"]][[22]]),
                        is_mss = unlist(newdata14[["result"]][[23]]),
                        is_focus = unlist(newdata14[["result"]][[24]]),
                        is_unscheduled = unlist(newdata14[["result"]][[25]]),
                        total_sales = unlist(newdata14[["result"]][[26]]),
                        stringsAsFactors = FALSE)


nd14<- rbind(nd13, newdata14)
#madhya pradesh
json_file16 <- "https://nrrmp.salesdiary.in:4018/api/sale_reports/get_sales_data?start_date=2018-01-01&end_date=2020-02-26"
newdata15 <- jsonlite::fromJSON(json_file13)
newdata15 <- data.frame(state = unlist(newdata15[["result"]][[1]]),
                        emp_code = unlist(newdata15[["result"]][[2]]),
                        salesman = unlist(newdata15[["result"]][[3]]),
                        mobile = unlist(newdata15[["result"]][[4]]),
                        role_name = unlist(newdata15[["result"]][[5]]),
                        order_date = unlist(newdata15[["result"]][[6]]),
                        area_name = unlist(newdata15[["result"]][[7]]),
                        zone_name = unlist(newdata15[["result"]][[8]]),
                        territory_name = unlist(newdata15[["result"]][[9]]),
                        beat_name = unlist(newdata15[["result"]][[10]]),
                        beat_type = unlist(newdata15[["result"]][[11]]),
                        distributor_name = unlist(newdata15[["result"]][[12]]),
                        distributor_code = unlist(newdata15[["result"]][[13]]),
                        outlet_name = unlist(newdata15[["result"]][[14]]),
                        outletid = unlist(newdata15[["result"]][[15]]),
                        prod_name = unlist(newdata15[["result"]][[16]]),
                        prod_code = unlist(newdata15[["result"]][[17]]),
                        outlet_type = unlist(newdata15[["result"]][[18]]),
                        categ_name = unlist(newdata15[["result"]][[19]]),
                        brand_name = unlist(newdata15[["result"]][[20]]),
                        qty_sales = unlist(newdata15[["result"]][[21]]),
                        line_type = unlist(newdata15[["result"]][[22]]),
                        is_mss = unlist(newdata15[["result"]][[23]]),
                        is_focus = unlist(newdata15[["result"]][[24]]),
                        is_unscheduled = unlist(newdata15[["result"]][[25]]),
                        total_sales = unlist(newdata15[["result"]][[26]]),
                        stringsAsFactors = FALSE)



combinednewdatasql <- rbind(nd14,
                         newdata15)
# combinednewdatasql
dbWriteTable(con,"updatednewtable1", combinednewdatasql , append = TRUE )



# dbDisconnect(con)