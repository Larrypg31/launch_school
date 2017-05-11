def sum(num)  #sum of digits
  string=num.to_s
  arr=string.split('')
  add=arr.join('+')
  eval(add)
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

def calculate_bonus(num,bool)
  bool ? num/2 : 0
 end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
