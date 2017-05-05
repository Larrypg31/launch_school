# Question 1
*For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:*

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2

*The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
Why is this and what are two possible ways to fix this?*

Because the answer 42 is an integer. You need to convert the answer to a string

"the value of 40 + 2 is " + (40 + 2).to_s
or
 "the value of 40 + 2 is #{40 + 2}"


# Question 3

*def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Bonus 1

What is the purpose of the number % dividend == 0 ?

Bonus 2

What is the purpose of the second-to-last line in the method (the divisors before the method's end)?*

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end

  divisors
end

The number % dividend is checking to make sure the division of the number from the dividend == 0 in other words no remainders.

The divisors on the second-to-last line is so the function returns the array of divisors.

# Question 4

I would choose <<
reason being this method is destructive on passed element so there is no need to reassign the variable.  

# Question 5
The limit variable is outside the scope of the method.  The code would return an undefined error.  You need to either pass in the variable or assign it inside the method


# Question 7
Returns 34, the number 50 was assigned to a new variable so the subtraction happens on the original answer.  

#Question 8
Remember that ruby passes in the Object_ID of the passed value so the value would change the hash

It's 34, the number 50 is assigned to new_answer

# Question 9

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") =>

puts rps(rps("paper", "rock")), "rock") =>

puts rps("paper", "rock") =>

paper


# Question 10

bar(foo) returns "no"

This is because foo is returning 'yes' therefore yes is being passed to the bar method. The if statement returns yes if the param is no and no if the param is yes.














###
