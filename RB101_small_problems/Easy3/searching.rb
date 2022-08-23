#solict 6 numbers from the user
# print a message that escribes wheter or not the 6th number appears among the first 5


user_numbers = []

5.times do |number|
  puts "please enter a number: "
  number = gets.chomp.to_i
  user_numbers << number
  user_numbers
end

puts "enter the last number: "
last_number = gets.chomp.to_i
if user_numbers.include?(last_number)
  puts "The number #{last_number} appears in #{user_numbers}."
else
  puts "The number #{last_number} does not appear in #{user_numbers}."
end
