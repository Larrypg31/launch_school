```ruby
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
```

** This should print out **

BOB, BOB

The reason for this is the ! indicator for ```upcase``` effects the String Object that both save_name and name are currently pointing at.
