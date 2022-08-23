#takes 1 argument, a string containing one or more words
#return the given string with words that contain five or more characters reverse
#each string will consist of only letters and spaces
#spaces should be included only when more than one word is present

#input: string
#output: string with words >5chars reverse

#input string
#split string by words
#loop through words
  #if word size >= 5
  #reverse word
  #else keep word
#join words back into one string

def reverse_words(str)
  array = []
  array = str.split
  for word in array
    if word.size < 5
      next
    else
      word.reverse!
    end
  end

  array.join(' ')   
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


#given solution:
def reverse_words(str)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end