# Working with blocks!

## Example 1
```ruby
[[1,2], [3,4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1.2], [3,4]]
```
- the Array#each method is being called on the multi-dimensional array.
- each inner array is passed to the block in turn and assigned to the local variable `arr`
- the Array#first method is called on `arr` and returns the ojbect at index 0 of the current array
  - in this case integers 1 and 3
- the `puts` method outputs a string representation of the integer
- puts returns nil and since this is the last evaluated statement within the block, the return value of the block is `nil`
- `each` doesn't do anything with this returned value
- the return value of `each` is the calling object, so that is what is ulitmately returned.

---
when evaluating code we want to look at:
 - type of action being performed?(method call, block, etc?)
 - what is the object that action is being performed on?
 - what is the side-effect of that action?
 - return value of the action?
 - is the return value used by whatever instigated the action?
---
## Example 2
another example:
```ruby
[[1,2], [3,4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```
- in line 1, the Array#map method is being called on the multi-dimensional array [[1,2], [3, 4]]
- each inner array is passed to the block in turn and assigned the local variable `arr`
- on Line 2: the Array#first method is caled on `arr` and returns the object at index  0 of the current array
- the `puts` method outputs a string representation of the integer
- `puts` method returns nil, and since this is the last evaluated statement within the block, the return value of the block is `nil`
- `map` performs transformation based on the return value of the block and on line 6, shows the return value as a new array [nil, nil].
---
## Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```
will output the following:
```ruby
# 1
# 3
# => [1, 3]
```

- in line 1, the Array#map method is being called on the multi-dimensional array [[1,2], [3, 4]]
- each inner array is passed to the block in turn and assigned to the local variable `arr`
- on line 2, the Array#first method is called on `arr` and returns the object at index 0 of the current array
- `puts` method outputs a string representation of the integer
- on line 3, the Array#first method is called on `arr`  which returns the ojject at index 0 of the current array
- since this is the last evaluated statement within the block, this is the return value of the block, 1 and 3 respectively.
- Array#map performs transformation on the original array based on the reutrn value of the block.
---
## Example 4

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
- in line 1: variable `my_arr` is assigned to the multi-dimensional array [[18, 7], [3, 12]]
- the `Array#each` method is called on the `my_arr` object and each inner array is passed to the block in turn and assigned to the local variable  `arr`
- lines 1-7 outer block execution:
  - Lines 2-6 inner block execution 
    - line 2: `Array#each`  method is called on the `arr` object and each object in the array is passed to the block and assigned to the local variable `num`
  - line 3: comparison statement `<`, `num` is evaluated if greater than integer 5, returns a boolean
  - line 3-5: conditional `if` result of the expression num > 5
  - line 4: if the variable `num` evaluates to `true`, in line 3, the `puts` method outputs a string representation of the integer. 
  - `puts` method returns `nil` and since this is the last statment evaluated in the block, `nil` is the return value of this block that starts in line 2
  - the block that starts in line 2's return value is `nil`, but the return value of `Array#each` is the original calling value, so that is the return value of line 2's block
- the return value of line 1's block is the calling value becuase of `Array#each` so the final return value is array assigned to variable `my_arr`
- the final output is:
```ruby
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
```
## Example 5
What will the return value be?
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

- line 1
  - action: method call Array#map
  - object: original array
  - side effect: none
  - return value: new array, transformation
  - is return value used?: no
- Lines 1-5 
  - outer block execution:
  - each sub-array
  - -side effect: none
  - return value: new transformed array
  - used? yes by top-level #map for transformation

  - Lines 2-4
    - inner block execution
    - -object: element within each sub-array
    - -return value: integer
    - -used? yes , by inner #map for transformation
  - 
    - Line 2:
      - method call Array#map
      - -object: integer
      - side effect:
      - return value: new transformed array
      - -used? : yes used to determine out blocks' return value
    - 
      - Line 3:
        - method call * with integer 2 as an argument
        - object: element within each sub-array
        - side effect:
        - return value: integer
        - used? : yes used to determine return value of inner block, array#map


----
## Example 7
sorting nested data structures
Ex: we want to sort the outer array so that the inner arrays are ordered according tothe numberic value of the strings they contain:
```ruby
arr = [['1', '8', '11'], 
['2', '6', '13'],
['2', '12', '15'],
['1', '8', '9']]
```
-each of the inner array sis compared with the other inner arrays
-they way they are compared is by comparing the elements within them "element-wise"
- bc they are strings, calling sort, string order will ultimately determine array order. 
- strings are compared character by character so this doesn't give us a NUMERICAL comparison.
```ruby
arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
```

need to do:
```ruby
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```
when we carry out transformation within a `sort_by` block, the transformed elemets are what are then used to perform the comparison. 
- each time the top-level block is called, we call `map` on the sub-array for the iteration
- within the map block, we call to_i, on each string within that particular sub-array which returns a new array with integers and leaves the original sub-array unmodified.
- this ends up sortingthe outer array aby comparing transformed integers in the inner arrays
- without any side effects.
---
## Example 8
- we only want to select nested elements based on certain criteria, eg: integers >13 but strings < 6chars
```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item # it it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ['apple]]
```
since it's a nested array, we can use #select method.
- first need to access the nested arrays before we can select the value we want.
- first determine it it's an integer
- Array#map is used not only to iterate over the array and access sthe nested array, but also to return a new array containing the selected values.
- if used #each instead, the return value would be the original array, would need extra variable to colelct the desired results.
---
## Example 9
TRIPLE LEVEL
```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
#=> [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
```
- there are 6 places where a return occurs:
  - 3 methos: map, each, partition
  - 3 blocks (one for each method)
  - the first method call within map is each = > we know that each doesn't acre about the block's return value and always returns the calling object. so we know that the return value of map is a new array that matches the vlue of the calling object.
  - no side effects deeper in the code.
---
## EXAMPLE 10

we want to increment every number by 1 without changing the data structure:
```ruby
[[[1, 2], [3, 4]], [5, 6]]. map do |arr|
  arr. map do |el|
    if el.to_s.size == 1 # it's an integer
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end
```
- line 1
  - action: Array#map method
  - object: nested array
  - side effect: none
  - return value: new array based on return value of block, transformation
  - rv used?: no
- Line 1 - 11  Outer block
- Line 2- 10  Inner block
- Line 5-8 Inner inner block
  - return value: new array of elements n + 1
- Line 2
  - Action: Array#map method
  - object: elements of nested array
  - side effect: none
  - return value: new array based on return value of block, transformation
  - used? yes in outer block #map method
- Line 3: 
  - Action: conditional `if`
  - object: element of nested arrays
  - side effects
  - return value: boolean
  - rv used? yes, if true, line 4
- Line 4:
  - returns integer
- Line 5: part of conditional
  - Line 6-7: if conditional results `false`
  - line 6: 
    - Array#map
    - element of nested nested array
    - add 1 to each element of array
    - returns new array with elements + 1
  -----

  ## DO NOT MUTATE COLLECTION YOU'RE ITERATING THROUGH
  iterating is the basis of selection and transformation, 

  an example of removing even integers from an array without mutating array that you're iterating through
  ```ruby 
  def remove_evens!(arr)
    cloned_arr = arr.dup
    cloned_arr.each do |num|
      if num % 2 == 0
        arr.delete(num)
      end
    end
    arr
  end
  ```
  this creates a shallow copy of the array and iterates through ti while mutating the oringal array