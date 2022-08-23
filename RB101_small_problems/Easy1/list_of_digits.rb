#method that takes one arugment, a positive integer and returns a list of the digits in the number
#input: a positive integer
#output: array of integers

def digit_list(number)
  array = []
  array = number.to_s.split('')
  array.map do |num|
    num.to_i
  end
end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true


#refactored:
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end
#^convert number to string. split into array of numberic characters.
#Enumerable#map and (&:to_i) is shorthand for something.map { |char| char.to_i }

def digit_list(number)
  number.to_s.split('').map(&:to_i)
end
