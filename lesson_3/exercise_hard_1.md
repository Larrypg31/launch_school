
# Question 1
What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

*Answer: Nothing, greeting would return nil
#*


# Question 2

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

{:a => 'hi there'}

# Question 3

What will be printed by each of these code groups?

*Answer
A.

puts "one is: one"
puts "two is: two"
puts "three is: three"

Reason is the method reassigns values but because of scope it does not reassign the values outside the method.  


B. Same thing when the method assigns the variables it does not change the variables outside the method.

C. Different, reason being is gsub! is changing the value stored within the object_id that the variables point to.*

#Question 4

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size==4
    while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end
