#write a method that counts the number of occurence of each element in a given array
#words are case-sensitive suv != Suv
#expected output
#car => 4
#truck => 3
#SUV => 1
#motorcycle => 2

#input: array (of strings?)
#output: prints number of occurances

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]



def count_occurrences(array)
  result = {}

  array.uniq.each do |element|
    result[element] = array.count(element) #creates a new key value pair in result hash
  end

  result.each do |element, count| #call each on the new hash, to print out the key/value pairs
    puts "#{element} => #{count}"
  end
end




count_occurrences(vehicles)


