
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
jj <- match(jan1_day, days)
print(paste("January 1st,", current_year, "was", days[jj]))

months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
kk <- match(this_month, months)
print(paste("today is", months[kk]))

if(as.numeric(current_year) %% 4 == 0){
  leap_year = TRUE
} else {
  leap_year = FALSE
}
if(as.numeric(current_year) %% 100 == 0){
  leap_year = TRUE
}
if(as.numeric(current_year) %% 400 == 0){
  leap_year = FALSE
}

print(paste("leap year:", leap_year))
month_length <- c(31, ifelse(leap_year, 29, 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
months_rep <- rep(months, month_length)

filename <- paste0(current_year, ".txt")
system(paste("touch", filename))
system(paste("rm -rf", filename))
system(paste("touch", filename))

commits <- paste0(current_year, ".commits.txt")
system(paste("touch", commits))
system(paste("rm -rf", commits))
system(paste("touch", commits))


for(dd in 1:ifelse(leap_year, 366, 365)){
    print(dd)
    aa <- dd %% 7
    if(aa == 0) aa <- 7
    print(aa)
    print(days[aa])
    print(months_rep[dd])
    print(length(grep(months_rep[dd], months_rep[1:dd])))
    print(
      paste(
        days[aa],
        months_rep[dd],
        length(grep(months_rep[dd], months_rep[1:dd])),
        "00:00:00",
        current_year,
        "+0000"
      )
    )
   print(
      paste(
        "echo",
        days[aa],
        months_rep[dd],
        length(grep(months_rep[dd], months_rep[1:dd])),
        "00:00:00",
        current_year,
        "+0000"
      )
    )
}


for(dd in 1:ifelse(leap_year, 366, 365)){
    print(dd)
    aa <- dd %% 7
    if(aa == 0) aa <- 7
    print(aa)
    print(days[aa])
    print(months_rep[dd])
    print(length(grep(months_rep[dd], months_rep[1:dd])))
    print(
      paste(
        days[aa],
        months_rep[dd],
        length(grep(months_rep[dd], months_rep[1:dd])),
        "00:00:00",
        current_year,
        "+0000"
      )
    )
   system(
      paste(
        "echo",
        days[aa],
        months_rep[dd],
        length(grep(months_rep[dd], months_rep[1:dd])),
        "00:00:00",
        current_year,
        "+0000",
        ">>",
        filename
      )
    )
}

for(dd in 1:ifelse(leap_year, 366, 365)){
    print(dd)
    aa <- dd %% 7
    if(aa == 0) aa <- 7
    print(aa)
    print(days[aa])
    print(months_rep[dd])
    print(length(grep(months_rep[dd], months_rep[1:dd])))
    print(
      paste(
        days[aa],
        months_rep[dd],
        length(grep(months_rep[dd], months_rep[1:dd])),
        "00:00:00",
        current_year,
        "+0000"
      )
    )
    if(days[aa] == "Sat" | days[aa] == "Sun"){
      msg <- "I work less on weekends"
      num_commits <- 2
    }
    if(days[aa] == "Tues" | days[aa] == "Wed"){
      msg <- "I have weekly meetings"
      num_commits <- 5
    }
    if(days[aa] == "Thu" | days[aa] == "Fri"){
      msg <- "I work on weekdays"
      num_commits <- 10
    }
    if(days[aa] == "Mon"){
      msg <- "I hustle on Mondays"
      num_commits <- 12
    }

    for(ff in 1:num_commits){
      system(
        paste0(
          "echo ",
          "git ",
          "commit ",
          "-m ",
          "\\\"",
          msg,
          "\\\" ",
          "--date ",
          "\\\"",
          days[aa], " ",
          months_rep[dd], " ",
          length(grep(months_rep[dd], months_rep[1:dd])), " ",
          "00:00:00", " ",
          current_year, " ",
          "+0000\\\"", " ",
          ">>", " ",
          commits
        )
      )
      system(paste("git add", commits))
      print(
        paste0(
          "git ",
          "commit ",
          "-m ",
          "\\\"",
          msg,
          "\\\" ",
          "--date ",
          "\\\"",
          days[aa], " ",
          months_rep[dd], " ",
          length(grep(months_rep[dd], months_rep[1:dd])), " ",
          "00:00:00", " ",
          current_year, " ",
          "+0000\\\"", " "
        )
      )
      
    }
}

