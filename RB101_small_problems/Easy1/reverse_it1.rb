#write a method that take 1 arugment, a string
#return new string with the words in reverse order
#input: string
#output: new string
#keep same capitalization
#empty string or only spaces returns empty string

#input string
#splits string into separate words(array)
#reverses words
#joins back into one string
#return string

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

def reverse_sentence(str)
  str.split.reverse.join(' ')
end