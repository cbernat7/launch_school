# exclusive or. method that take 2 arguments and returns true if exactly one argument is truthy
# false if both are fasley or both are truthy
# return value is boolean

def xor?(operand1, operand2)
  if operand1 && operand2
    false
  elsif operand1 == false && operand2 == false
    false
  else
    true
 end
end


puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false


# that works, below is refactored:

def xor?(val1, val2)
  return true if val1 && !val2
  return tru if val2 && !val1
  false
end

# or

def xor?(val1, val2)
  !!((val1 && !val2) || (val2 && !val1))
end