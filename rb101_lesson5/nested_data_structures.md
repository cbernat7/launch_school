# Nested Data Structures

```ruby
arr = [[1, 3], [2]]
arr[1] = 'hi there'
arr  # =>[[1, 3], 'hi there] 
```
^line 2 is a destruction action that permanently changed the 2nd element in the array.
can also modify a value in a nested array in a similar way:
```ruby
arr[0][1] = 5
arr #=> [[1,5] 'hi there]
```
chained `array element update`
1st part if element reference
2nd part is element update

`chain element reference with appending an element`
arr = [[1], [2]]
arr[0] << 3
arr # => [[1, 3], [2]]

^line 2 is a two part chain.. first part is element referene and returns [1]. second part destructivley appends 3 into the inner array.

---
Hashes can also be nested in an array:
```ruby
[{a: 'ant'}, {b:'bear'}]
#to add a new key/value pair into the first inner hash is a 2 step process
arr[0][:c] = 'cat'
arr # =>[{ :a => "ant", :c => "cat" }, { :b => "bear" }]
```
first we retrieve the first inner hash
then use the normal hash key/value creation syntax to create a new k/v pair.
destructive

---
Variable reference for nested collections:
-when variables are referencing inner collections directly. ex:
```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr #=> [[1,3], [2]]
```
the local variables: a and b, are pointing to Array objects. what happens if we modify a after placing it in arr? ex:
```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]

a[1] = 5
arr # => [[1,5], [2]]
```
the value of `arr` changed bc a still points to the same array object that in arr.
when we modified a, we were modifying the array object.

is modifying the first array in `arr` different than modifying `a` directly?
```ruby
arr[0][1] = 8
arr # =>> [[1, 8], [2]]
a # => [1, 8]
```
produces the same result as modifying a directly. becase we're modifying the OBJECT that a and arr[0] points to. because they are variables as pointers.

---
Shallow copy
2 methods to copy an object, including collections:
1. dup
2. clone
  
Both create a shallow copy. that means only the object that the method is called on is obied. if the object contains other objects, like nested array, those objects will be shared not copied.

dup: allows objects within the copied objet to be modified.
```ruby
arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2[1].upcase!
arr2 #=> ['a', 'B', 'c']
arr1 #=> ['a', 'B', 'c']
```

clone:
```ruby
arr1 = ['abc', 'def']
arr2 = arr1.clone
arr2[0].reverse!
arr2 #=> ['cba', 'def']
arr1 #=> ['cba', 'def']
```

in both these examples, BOTH arr1 and arr2 are changed. because the destructive methods were called on the object WITHIN the array rather than the array itself. the objects are shared.

if the destructive is called on the array itself, the original array is not changed, but if the method is called on the element on the array, it changes the orig array bc it is a reference to the object. ex:
```ruby
arr1 = ['a','b','c']
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 #=> ['a','b','c']
arr2 #=> ['A''B','C']
```

VS
```ruby
arr1 = ['a','b','c']
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ['A''B','C']
arr2 # => ['A''B','C']
```
---
Freezing objects:
the main difference:
1. dup: doesn't preserve frozen state of object
```ruby
arr1 = ['a','b','c'].freeze
arr2 = arr1.dup
arr2 << 'd'
arr2 #=> ['a','b','c', 'd']
arr1 #=>  ['a','b','c']
```
   
2. clone: clone preserves the frozen state of the object
```ruby
arr1 = ['a','b','c'].freeze
arr2 = arr1.clone
arr2 << 'd'
#=> RuntimeError: can't modify frozen array
```

objects can be frozen to prevent them from being modified.
only mutable objects can be frozen. immutable objects like integers are already frozen. can use #frozen? to check

only freezes the object it's called on.
if the object contains other objects, those won't be frozen.
ex in nested array, the nested  objects can still be modified after calling `freeze`. also strings within an array:

```ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr #=> [[1]. [2]. [3,4]]

arr2 = ['a','b','c'].freeze
arr2[2] << 'd'
arr2 #=> ['a','b','cd']
```
---
DEEP COPY
there's no built-in/easy way to create a deep copy for deep freeze objects within objects.

remember the level within the collecting you're working esp with `freeze, dup`, and `clone`

