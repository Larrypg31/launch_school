=begin
Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.
=end

def show_multiplicative_average(array)
  result = (array.inject(:*) / array.size.to_f).round(3)
  p format('%.3f', result)
end

p show_multiplicative_average([3, 5])=="7.500"
p show_multiplicative_average([6])=="6.000"
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) == "28361.667"
