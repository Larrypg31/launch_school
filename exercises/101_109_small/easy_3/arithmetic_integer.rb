# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.
# ==> 23 + 17 = 40

def prompt(msg)
  puts ">> #{msg}"
end

prompt "Please enter a positive integer."
num1 = gets.chomp.to_i
prompt "Please enter a 2nd positive integer"
num2 = gets.chomp.to_i


prompt "#{num1} + #{num2} = #{num1 + num2}"
prompt "#{num1} - #{num2} = #{num1 - num2}"
prompt "#{num1} * #{num2} = #{num1 * num2}"
prompt "#{num1} / #{num2} = #{num1 / num2}"
prompt "#{num1} % #{num2} = #{num1 % num2}"
prompt "#{num1} ** #{num2} = #{num1 ** num2}"
