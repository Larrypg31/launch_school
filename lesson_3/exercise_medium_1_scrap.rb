10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

puts "the value of 40 + 2 is #{40 + 2}"

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end

  divisors
end

p factors (41)

p factors (0)






def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param << " rutabaga"
  an_array_param << ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"




answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8



def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

p rps("rock","paper")












#
