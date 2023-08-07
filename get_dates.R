
#! /usr/bin/R

current_year <- commandArgs(trailingOnly=TRUE)
print(current_year)

today =  format(Sys.time(), "%a %b %e %X %Y +0000", tz = "UTC")

day_of_the_week =  format(Sys.time(), "%a", tz = "UTC")
now = Sys.time()
this_year = format(Sys.time(), "%Y", tz = "UTC")
this_month = format(Sys.time(), "%b", tz = "UTC")

if(length(current_year)==0) current_year <- this_year
print(current_year)

days <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
ii <- match(day_of_the_week, days)
print(paste("today is", days[ii]))
jan1_day <- format(as.Date(paste0(c(current_year, "01-01"), collapse="-")), "%a", tz = "UTC")
ii <- match(jan1_day, days)
print(paste("January 1st,", current_year, "was", days[ii]))

months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
jj <- match(this_month, months)
print(paste("today is", months[jj]))

if(as.numeric(this_year) %% 4 == 0){
  leap_year = TRUE
} else {
  leap_year = FALSE
}
if(as.numeric(this_year) %% 100 == 0){
  leap_year = TRUE
}
if(as.numeric(this_year) %% 400 == 0){
  leap_year = FALSE
}

print(paste("leap year:", leap_year))
month_length <- c(31, ifelse(leap_year, 29, 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)

