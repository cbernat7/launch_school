# method that returns an array that contains every other element of array that is passed as an argument
# values in the returne list should be the values that are in the 1, 3, 5th elements of array etc

# def oddities(arr)
#   odd_elements = []
#   index = 1
#   while index < arr.size
#     odd_elements << arr[index]
#     index += 2
#   end
#   odd_elements
# end




p oddities([2, 3, 4, 5, 6]) 
p oddities([1, 2, 3, 4, 5, 6]) 
p oddities(['abc', 'def']) 
p oddities([123]) 
p oddities([]) 
