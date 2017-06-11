def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, digit)
  array = number.to_s.split('')
  array[-digit..-1] = rotate_array(array[-digit..-1])
  array.join.to_i
end

def max_rotation(number)
   count = number.to_s.split('').size
   r_number = number
   count.downto(2) do |i|
     r_number = rotate_rightmost_digits(r_number, i)
   end
   r_number
end

p max_rotation(735_291) == 321_579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
