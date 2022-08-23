#method that takes 1 argument
#positive integer
#reutrns the sum of its digits
#examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

#input integer
#separate digits into separate integers
#sum the digits
#return sum

def sum(integer)
  integer.digits.reduce(:+)
end

#other solutions

def sum(number)
  sum = 0 
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

#or
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end