# prompt user for 2 positive integers
# print the results of the following operations on the two nubmers
# add, subtract, product, quotient, remainder, power
# don't worry about validating the input

puts "enter the first number: "
num1 = gets.chomp.to_i
puts "enter the second number:"
num2 = gets.chomp.to_i

puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"
puts "#{num1} / #{num2} = #{num1 / num2}"
puts "#{num1} % #{num2} = #{num1 % num2}"
puts "#{num1} ^ #{num2} = #{num1 ** num2}"