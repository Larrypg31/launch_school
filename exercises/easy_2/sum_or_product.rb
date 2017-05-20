=begin
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

def prompt(msg)
  puts ">> #{msg}"
end

def valid_choice?(valid,answer)
  answer.downcase!
  valid.include?(answer)
end

def valid_number?(num)
  num.to_i > 0 && num.to_i.to_s == num
end

def sum(nums)
  puts "The sum of the integers between #{nums.begin} and #{nums.end}" \
       " is #{nums.reduce(:+)}"
end

def product(nums)
   puts "The product of the integers between #{nums.begin} and #{nums.end}"\
        " is #{nums.reduce(:*)}"
end

number = nil
loop do
  prompt ("Please enter an integer greater then 0:")
  number = gets.chomp
  break if valid_number?(number)
  prompt "That is not a valid number!"
end

numbers = (1..number.to_i)

choice = ''
loop do
  prompt ("Enter 's' to compute the sum, 'p' to compute the product.")
  choice = gets.chomp
  break if valid_choice?(%w[s p],choice)
  prompt "#{choice} is not a valid option!"
end

choice == 's' ? sum(numbers) : product(numbers)
