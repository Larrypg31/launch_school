

def multisum(num)
  numbers = (1..num).select {|n| n % 3 == 0 || n % 5 == 0}
  numbers.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234_168
