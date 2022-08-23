Guide for written exam:

## Specific topics
- local variable scope*
  - how local variables interact with method invocations with blocks and method definitions
- mutating vs non-mutating methods*
- pass-by-reference vs pass-by-value**
- working with collections*
  - Array, Hash, String
- popular collection methods*
  - Each, map, select
- Variables as pointers**
- Puts vs return+
- False vs nil, the idea of truthiness+
- Method definition and method invocation+
- implicit return value of method invocations and blocks+
- how the Array#sort method works**

### How to answer the assessment questions:
- testing ability to parse code nd describe it with precision
  - knowledge of specific syntactical aspect
- understanding of a deeper, underlying principle
  - fundamental aspect of Ruby or programming in general

### Answering the questions:
- explain reasoning with reference to specific lines in the program
- answer with precision: ex say "method declaration" or "method invocation" vs just saying "method"
- highlight any specific syntactical conventions or technical observations where relevant
- identify the key fundamental concept(s) being demonstrated

## Example:
Examine the code below. The last line outputs the String `Hi` rather than the String `Hello` Explain what is happening here and identify the udnerlying principle that this demonstrates.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

An answer that would get full points:
The local variable `greeting` is assigned to the String `'Hello'` on line 1. The `do..end` alongside the `loop` method invocation on lines 3 to 6 defines a block, within which `greeting` is reassigned to the String `Hi` on line 4. The `puts` method is called on line 8 with the variable `greeting` passed to it as an argument; since `greeting` is now assigned to `Hi`, this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.

Usually it's better to use narrative form than bullet points.

## Precision of Language
```ruby
def a_method
  puts "hello world"
end
```
A correct answer would be: The mothod invocation outputs the string hellow world and returns nil.


## Specifics:
### Assignments
consider the following:
```ruby
greeting = 'Hello'
```
both are correct: 
- "the greeting variable is assigned to the string 'Hello'"
- "The string 'Hello' is assigned to the greeting variable."
Both would be acceptable but be consistent.

### Truthiness
be very clear about the distinction between truthy and the boolean `true`, falsey and the boolean `false`
-in Ruby, every value apart from `false` and `nil` evaluates as true in a boolean context. so every value execpt for `false` and `nil` are truthy. `false` and `nil` are falsey.
example:
```ruby
a = 'Hello'

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```
- a evaluates as true in the conditional statement so "Hello is truthy" is output
- a is truthy and so 'hello is truthy' is output

in a boolean context use: "evaluates to true","evaluates as true" or "is truthy"
do not use "is true" unless specifically discussing the boolean `true`
same for falsey and `false`

## Method Definition and method invocation
explain methods (esp how block and methods interact w local variables) in terms of method definition and method invocation.
Review 101.2.19

## Variable references and object mutability articles:
review the articles.


