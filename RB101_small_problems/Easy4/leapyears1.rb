#leap year occurs every year that is evenly divisible by 4
#unless the year is also divisible by 100
# if divisible by 100, not a leap year unless evenly divisible by 400
#assume this is true for any year greater than year 0

# method that takes a year>0 as an input
# returns true if year is a leap year
# false if it is not

#input year in integer
#check if the year is evenly diviible by 4
  #check that one is also divsible by 100 
  #if yes return false, else return true
#check if divisible by 100
  #if also divisible by 400
  # return true, else false

# update method for the Julian/Gregorian calendar
# 1752 is a leap year
# prior to 1752, leap years are any year that is evenly devisible by 4



def leap_year?(year)
  if year <= 1752
    year % 4 == 0
  elsif year > 1752
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
  end  
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true