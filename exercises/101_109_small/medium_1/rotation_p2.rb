def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, digit)
  array = number.to_s.split('')
   array[-digit..-1] = rotate_array(array[-digit..-1])
   array.join.to_i

end

p rotate_rightmost_digits(735_291, 1) == 735_291
p rotate_rightmost_digits(735_291, 2) == 735_219
p rotate_rightmost_digits(735_291, 3) == 735_912
p rotate_rightmost_digits(735_291, 4) == 732_915
p rotate_rightmost_digits(735_291, 5) == 752_913
p rotate_rightmost_digits(735_291, 6) == 352_917
