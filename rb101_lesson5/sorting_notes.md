Sorting

- mostly performed on arrays since arrays are accessed via index
- strings don't have access to sorting methods, but we can `#to_a` and back to sort
- since 1.9, we can sort a hash, but not as necessary bc we can access values via keys.

Sorting = setting the order of items in a collecction according to a certain criterion.

---
`method` #sort
```Ruby
[2,3,4,5].sort #=> [1,2,3,4,5]
```

- return value is a new array with the integers ordered sequentially according to value.
- sorting carried out by comarison

```ruby
['c', 'a', 'e', 'b', 'd'].sort #=> ['a', 'b', 'c', 'd', 'e']
 ```
- returns a new array of characters ordered alphabetically
- uses the <=> `method`

---
the <=> `method`

- any object we want to sort must implement a <=> `method`
- performs comparison between 2 objects of the same type and returns:
  - `-1` if 1st < 2nd
  - `0` if they are equal
  - `1` if 1st > 2nd
  - `nil` if objects can't be compared
- The reuturn value of of the <=> method is used by `sort` to determine the order in which to place items. 
```ruby
['a', 1].sort # => ArgumentError
```
- sort only cares about the return value of the <=> method
- need to know:
1. does the object type implement a <=> comparison method?
2. if yes, what is the specific implementation of that method for the object eg:
   1. `String#<=>` is different than
   2. `Integer#<=>`

---
`String#<=>` method
- uses the ASCII character order
```ruby
'A' <=> 'a' # => -1
```
bc A precedes a in the ASCIIbetical order
also: ! < 'A
- can determine a string's ASCII position by calling `ord` on the string
- `'b'.ord` => 98
- Uppercase comes before lowercase
- Digits and most punctuation comes before letters
- there is an extended ASCII table with accented and other characters which comes after the main table
----
SORT WITH A BLOCK
- block needs 2 arguments passed to it
- the return value of the block has to be `-1,0,1,` or `nil`

```ruby
[2,5,4,3,1].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]
```
^ this just uses Integer#<=> in the block which is exactly what `sort` does by itself without the block of code.


---
`method` #sort_by

- similar to sort but usally called with a block
- code in the block determines how the items are compared
```ruby
['cot', 'bed', 'mat'].sort_by do |word|
word[1]
end
# => ['mat', 'bed', 'cot']
```

calling `sort_by` on a hash:
2 arguments get passed to the block:the key and the value.
```ruby
people = { Kate: 27, john: 25, Muke: 18}
people.sort_by do |_,age|
  age
end
# => [[:Muke, 18], [:john, 25], [:Kate, 27]]
```
-RETURNS AN ARRAY WITH THE KEY-VALUE PAIRS as objects in enested arrays.
- can we order that hash by names?
- is there a `Symbol#<=>` method?
- Yes, symbols are compared after `to_s` is called on them
  - `to_s` returns the name or stringn corresponding to the symbol
  - so we're basically comparing strings.
  - can first use the method `Symbol#capitalize` for each name in the block so when the keys are compared they are all capitalized.
  - ---
  Array#sort! and Array#sort_by!
    - instead of returning annew collection, the same collection is returned but sorted
    - specific to arrays
----
Other `methods` which use comparison:
- min
- max
- minmax
- min_by
- max_by
- minmax_by

^these are in the Enumerable module which are available to Array and Hah.