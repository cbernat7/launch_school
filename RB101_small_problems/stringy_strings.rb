#method that takes 1 argument, a positive integer
#returns a string of alternating 1s and 0s
#always starting with 1
#length of the string should match the given integer

#input: integer
#output: string of integers 

#input integer
#iterate
#start with 1 
#until string length == integer,
  #add 0 and 1 to end of string alternating
#return string


def stringy(number)
  numbers = []
  
  number.times do |index|
   number = index.even? ? 1 : 0
   numbers << number
  end

  numbers.join
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'