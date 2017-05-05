
def tricky_method(a_string_param, an_array_param)
  a_string_param <<  "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)



puts my_string.object_id
puts my_array.object_id

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts my_string.object_id
puts my_array.object_id



def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end



def color_valid(color)
  color == "blue" || color == "green"
end
