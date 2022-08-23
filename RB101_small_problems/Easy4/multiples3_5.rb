# search for all multiples of 3 or 5 that lie between 1 and anothe rnumber
# compute the s um of those multiples
# can assume the number passed in an integer greater than 1
#example: n =20, result = 98 (3+5+6+9+10+12+15+18+20)

# input integer > 0
# set empty array
# loop through integers from 1 to n
# if integer is multiple of 3 or 5, push to new array
# sum of new array
# return sum

# def multisum(num)
#   result_arr = []
#   for n in (1..num) do
#     if n % 3 == 0 || n % 5 == 0
#       result_arr << n
#     end
#   end
#   result_arr.sum 
# end


def multisum(num)
  (1..num).to_a.select { |n| n % 3 == 0 || n % 5 == 0}.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168