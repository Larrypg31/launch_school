=begin
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".
=end

def fizzbuzz(num1, num2)
  results = []
  num1.upto(num2) do |num|
    results << check_modular(num)
  end
  p results.join ', '
end

def check_modular(num)
  case
  when num % 3 == 0 && num % 5 == 0
    "FizzBuzz"
  when num % 3 == 0
    "Fizz"
  when num % 5 == 0
    "Buzz"
  else
    num.to_s
  end
end



fizzbuzz(1, 15)
