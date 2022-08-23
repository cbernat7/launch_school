# # method that takes 22 arguments, multiplies them and returns result
def multiply(num1, num2)
   num1 * num2
 end

# puts multiply(5, 3) == 15

# use multiply method, write a method that computes the square of its argument
def square(n)
  multiply(n, n)
end

puts square(5) == 25
puts square(-8) == 64