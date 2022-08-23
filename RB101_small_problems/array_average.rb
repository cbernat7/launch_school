#takes one argument, an array containing integers
#returns the average of all numbers in the arrary
#array will never be empty
#numbers will always be positive
#result should be an integer

#input array
#output integer

#input array of integers
#add up all the integers
#divide by n number of integers in the array
#return sum

def average(array)
  sum = 0
  average = 0
  array.map do |number|
    sum += number
  end
  average = sum / array.size

end


#given solution:
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number}
  sum / numbers.count
end

#or
numbs.reduce(:+)