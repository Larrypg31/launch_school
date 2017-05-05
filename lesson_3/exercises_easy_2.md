# Question 1

_Check if spot is present_

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.key?("Spot") ages.has_key?("Spot") ages.include?("Spot")

# Question 2

*Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

Convert the string in the following ways (code will be executed on original munsters_description above):

"The munsters are creepy in a good way." "tHE mUNSTERS ARE CREEPY IN A GOOD WAY." "the munsters are creepy in a good way." "THE MUNSTERS ARE CREEPY IN A GOOD WAY."*

p munsters_description.capitalize p munsters_description.swapcase p munsters_description.downcase p munsters_description.upcase

# Question 3

*We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 } add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }*

ages.merge!(additional_ages)

# Question 4

advice = "Few things in life are as important as house training your pet dinosaur."

advice.match("Dino")

# Question 5

_Show an easier way to write this array: flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]_

flintstones= %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6

*ADD Dino to the flintstones array*


flintstones << "Dino"


# Question 7

flintstones.push("Dino", "Hoppy")



# Question 8
*shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."
...remove everything starting from "house".

Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?*

p advice.slice!(0, advice.index('house'))

what line of code is stating to keep index 0 - starting index of house and returns the sliced off portion.  the '!' is telling ruby to make the slice destructive leaving the string "Few things in life are as important as" assigned to advice.  

if you do not use the '!'

p advice.slice(0, advice.index('house'))

Then the return value is the same as the first version, but the string assigned to advice is left unchanged.


#Question 9
*statement = "The Flintstones Rock!"*

p statement.count('t')

# Question 10
*Center this in 40 spaces
title = "Flintstone Family Members"*

p title.center(40)


# Question 11


#
