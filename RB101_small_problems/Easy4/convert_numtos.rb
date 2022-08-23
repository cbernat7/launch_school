# input positive integer or zero
# converts to string representation
# cannot use #to_s, String(), Kernel#format


# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char]}
#   value = 0
#   digits.each { |digit| value = 10 * value + digit}
#   value
# end

# input integer
# split? into array?
# loop through array
# each element in array ??
#return the element in DIGITS array of DIGITS[number]
# return string

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'