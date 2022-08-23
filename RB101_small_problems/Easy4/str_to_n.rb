# take a string of digits
# return the appropriate num as an integer
# cannot use String#to_i or Integer()
# do not worry about leading + or -
# assume all characters will be numberic

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' =>8, '9' => 9 
}


def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char]}
  p digits
  value = 0
  digits.each { |digit| value = 10 * value + digit}
  p value
  value

end


string_to_integer('4321') == 4321
string_to_integer('570') == 570