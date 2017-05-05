
# Question 1/2

*answer:
as long as the values are the same the object_id will be the same, once the value is changed then the object_id changes.  anything defined within the block will not be accessible outside the block

Same answer for question 2.  The big difference in question 2 is that the method does not have access to variables that are defined outside the method unless those variables are passed in.  

The big takeaway between both these questions is that if the value is the same then the Object_id will be the same.  so no matter what (42, (40+2), m=42) all have the object_id of 85 no matter where it is defined in the program.*


# Question 3/4
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

*answer :
puts "My string looks like this now: pumpkins"
puts "My array looks like this now: [pumpkins, rutabaga]"

The string's value is passed into the method and a_string_param is changed to pumpkinsrutabaga but this does not effect my string because the assignment operator used does not effect the value of the original object_id.  

The my_array variables value is also passed, the assignment variable << appends the new value to the Object_id since the variable my_array is pointing to a that Object_id the value is then changed in the variable outside the method.


For question 4 this is just reversed*


# Question 5

def color_valid(color)
  color == "blue" || color == "green"
end
