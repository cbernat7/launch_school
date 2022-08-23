# # return true if the string is a palindrome, false if otherwise
# # palindrome reads the same forward and backwards
# # case does matter
# # punctuation and spaces matter

def palindrome?(string)
  string == string.reverse
end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true

# # determine if an array is palindromic
# # do the element values appear in the same sequence both forwards and backwards?

def arr_palindrome?(arr)
  arr == arr.reverse
end




# write a method that can take a string or an array
# do not use if, unless, case

def any_palindrome?(entry)
  entry == entry.reverse
end

# p any_palindrome?([1, 2, 3, 2, 1]) == true
# p any_palindrome?([1, 2, 6, 7, 8]) == false
# p any_palindrome?('madam') == true
# p any_palindrome?('Madam') == false          # (case matters)
# p any_palindrome?("madam i'm adam") == false # (all characters matter)
# p any_palindrome?('356653') == true


# new method that is case insensitive
# ignore all non-alphaneumeric characters
# can call palindrome? from within method

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false