# Question 1

I expect it to put out all the numbers, 1,2,2,3 on separate lines because uniq is not a destructive method.  If we want it to be destructive we can add ! after uniq

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers


# Question 2

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. What is != and where should you use it?
    * It means Not equal, use it as a comparison operator to return truthy or not truthy.

2. Put ! before something, like !user_name
    * This is again a comparison operator. It basically means anything but the user_name. or not the user_name.

3. Put ! after something, like words.uniq!
    * This is part of ruby style, is part of the method name.  Ruby style guide states should be use to indicate a destructive method.

4. Put ? before something
    * I believe this is a ternary operator meaning if something.

5. put ? after something
    * Means it is expecting a boolean response. This is another style guideline. It just makes it easier to understand your code.

6. put !! before something, like !!user_name
    * honestly had to look this up... it returns the boolean value of an object.  


# Question 3

 Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')


# Question 4

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
* this will delete at the index 1 which will remove the number 2 from the array and it will return a value of the number it removed. if the index does not exist it will return nil

numbers.delete(1)
* this will remove all instances with the value of 1 within the array. If the value provided does not exist it will return nil.

# Question 5

Programmatically determine if 42 lies between 10 and 100.
  * At first i chose include? because I am more familiar with this function.  After research I see that include? takes longer to execute and include checks to see if the value is included within the range where cover? checks to see if the value would fall within the range even if it isn't included.  The code below demonstrates this.

   Answer (10..100).cover?(47)

demonstration of the difference between cover? and range?
p ('a'..'z').include?('dd')

p ('a'..'z').cover?('dd')


# Question 6
* show two different ways to put the expected "Four score and " in front of it.

I thought you meant adding it to the variable


famous_words = "seven years ago..."

famous_words = "Four scores and #{famous_words}"

famous_words.prepend("Four scores and ")

famous_words= "Four scores and " + famous_words



# Question 7
* If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call

42, reason is that the eval function basically uses the string "number" as a variable.


#Question 8
* If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
Make this into an un-nested array.


# Question 9

flintstones= flintstones.assoc("Barney")




#
