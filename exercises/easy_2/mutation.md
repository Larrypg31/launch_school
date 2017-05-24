What will the following code print out?
```ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
```

** This will print the values :**

- Moe
- Larry
- CURLY
- SHEMP
- Harpo
- CHICO
- Groucho
- Zeppo

The reason for this is when array1 is mutated it is changing the values within the Objects.  Since both arrays point to the same object a change in one will effect the other.
