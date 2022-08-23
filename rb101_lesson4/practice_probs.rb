#turn this arry into a hash where the names are the key and values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index 
end

#Add up all of the ages from the Munster family hash:
sum = 0
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.value do |age|
  sum += age
end

#another solution:
ages.values.inject(:+)

#ages.values makes an array
#inject(:+) apply the + operator to the accumulator 

#remove people from the age hash w age 100 and greater
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.select! do |key, value|
  value < 100
end

#can also do:
ages.keep_if {|_,age| age < 100}

#Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min

#find the index of the first name that starts w "be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name.start_with?("Be")}
#or
flintstones.index { |name| name[0, 2] == "Be"}


#Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0, 3]
end

#or
flintstones.map! { |name| name[0, 3]}

#or
flintstones.map! do |names|
  names.slice(0..2)
end

#Create a hash that expresses the frequency with which each letter occurs in this string:
#{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }


statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end


#8. what happens when we modify array while iterating over it?
#what would be the output of this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

#9.  Change this string to words = "The Flintstones Rock"


words = "the flintstones rock"
words.split.map { |word| word.capitalize }.join(' ')

#10.modify the hash so each member has an additional "age_group" key
#has one of the 3 values, (kid 0-17, adult 18-64, or senior 65+)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, attributes| 
case attributes["age"]
when 0..18 then attributes["age_group"] = "kid"
when 18...65 then attributes["age_group"] = "adult"
else attributes["age_group"] = "senior"
  end
end
