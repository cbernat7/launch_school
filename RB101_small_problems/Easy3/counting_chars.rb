# ask for input of word or multiple words
# return numbe of characters
# spaces are not counted as characters, punctuation is counted.

puts "please enter a word or words to be counted: "
answer = gets.chomp
num_characters = answer.delete(" ").length
puts "There are #{num_characters} characters in \"#{answer}\"."