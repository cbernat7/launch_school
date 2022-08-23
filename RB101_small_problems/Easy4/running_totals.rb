# take an array of numbers
# returns an array with the same number of elements
# each element has the running total from the original array

# input array of integers > 0
# loop through array
# create new array 
# add the current element to previous element(s) as loop through
# return new array

def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []