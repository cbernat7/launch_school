  #order this array of number strings by descending numeric value?
#  arr = ['10', '11', '9', '7', '8']
#
#  arr.sort do |a, b|
#    b.to_i <=> a.to_i
#  end

#order this array of hashes based on the year of publiction of each book
#form earliest to lastest.
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

#1. access each hash in array 2.access year published in each hash 3.sort by year published 4.return array of hashes

books.sort_by do |book|
  book[:published]
end

# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]


arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)


#for each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

#figure out the total age of just the male members of the family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each_value do |details| #reference the value of outer hash (age, gender)
  total_male_age += details["age"] if details["gender"] == "male"
end

#6.string substitution
#print out the name age and gender of each familiy member of the munsters lke this:
#(Name) is a (age)-year-old (male or female)

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end


#7. given this code what would be the final values of a nd b?
a = 2
b = [5, 8]
arr = [a, b]
# arr => [2, [5, 8]]

arr[0] += 2
# arr => [4, [5, 8]]
arr[1][0] -= a
# arr => [4, [3, 8]]

#using each method, write code to output all the vowels from the strings
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'
hsh.each do |_,value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

#first iterate through the hash to access the values(the arrays)
#then iterate through each array to access each string
#then String#chars can be called within the block to return an array of characters for that string in that iteration
#puts if it meets the condition

#9. return a new array of the same structure but with the sub arrays being ordered
#alphabetically or numberically as appropriate in descending order
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

# 10. without modifying the original array, use map to return a new array
#idential in structure but the value of each integer is incremented by 1
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


#use map to return a new array with same structure
arr1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr1.map do |item|
  item.transform_values {|value| value += 1}
end

#or

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hsh = {}
  hsh.each do |key, value|
    incremented_hsh[key] = value + 1
  end
  incremented_hsh
end

#solved using each with object:
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hsh = {}
  hsh.each do |key, value|
    incremented_hsh[key] = value + 1
  end
  arr << incremented_hsh
end

# 11. use a combination of methods, including either the select or reject method, 
#to return a new array identical in structure to the original 
#but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

#return new array with same structure
#need to access inner array then loop through each element and select only integers that are multiples of 3

arr.map do |item|
  item.select do |num|
    num % 3 == 0 
  end
end

#12. without using Array#to_h, return a hash where the ke is the first item in each sub array
#value is second item
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

#return value is a hash
#loop through 1. outer array
#2.inner array take first item make it a key, second item make it a value.
#return hash

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end


# 13.
#return a new array containing the same sub-arrays as the orig but ordered logically
#only taking into consideration the odd numbers they contain

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
#expected output: [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

#return nested array
#keep same sub-arrays, elements in sub arrays are in the same order
#ordered only by odd numbers ex [1,5,9] comes before [1,6,9]
#need to loop through outer array.
#somehow compare elements of inner arrays with each other, ignoring even numbers
#sort_by method?

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

#14. return array containing the colors of the fruits and sizes of veggies
#sizes should be uppercase
#colors should be capitalized
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#returns array
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
#inside outer hash:
#don't care about outer hash key at all
#need to sort by :type (fruit or veggie)
#if 'fruit' select colors, capitalize colors
#if veggie, select sizes, upcase size
#return new array

hsh.map do |_,value|
  if value[:type] == "fruit"
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == "vegetable"
    value[:size].upcase 
  end
end


#16. return an array which contains only the hashes where all the integers are even
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

#input = an array of hashses, keys are all sybols, each value is an array of integers
#return an array of hashes - might use map to return a new array of return value of the block
#select only the hashes were all integers are even
#need to evaluate each integer in a hash and reject if even one integer is odd/select only if all are even
#1.main array 2.inner hashes 3.hsh values - array of integers

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
  end
end

#select returns all elements for which the block returns true, can use the #all method

# 16.
#UUID type of identifer often used a sa way to uniquely identify items.
#32 hexadecimal charaacters that are typically broken into 5 sections 8-4-4-4-12 and represented as a string
#ex:"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#write a method that returns one UUID when called with no parameters

#create an empty array
#add possible digits to the array, numbers 0-9 and letters a-f
#convert numbers to string

#from the array, take a random digit and add to UUID number
#specify the number of digits in each section of the ID



def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end
  
  uuid
end

#section array contains integers representing the numbers of characters in each section
#during each interation through the array, within the block we can call the times method on the integer for that iteration
#and build up the UUID character by character

