# the string might have a leading + or -
# if the first char is a +, return positive num
# if -, return negative num
# if no sign given, return positive num

#check if there's a sign in front
# if no sign, call string_to integer
# if positive sign, remove sign and call string_to_integer
# if negative sign, call string to integer
  # multiply value by -1
  #return value

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' =>8, '9' => 9 
}


def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char]}
  value = 0
  digits.each { |digit| value = 10 * value + digit}
  value
end

def string_to_signed_integer(string)
  array = string.chars
  if array[0] == '-'
    array.shift
    string = array.join
    string_to_integer(string) * -1
  elsif array[0] == '+'
    array.shift
    string = array.join
    string_to_integer(string)
  else
    string_to_integer(string)
  end
end


#refactored


def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100