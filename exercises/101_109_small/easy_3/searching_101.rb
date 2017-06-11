def prompt(msg)
  puts ">> #{msg}"
end

def valid_integer?(num)
  num.to_i.to_s == num
end

numbers = []
search_number = nil

count = nil
6.times do |i|
  count = i + 1

  case count
  when 1
    prompt 'Please enter the 1st number:'
  when 2
    prompt 'Please enter the 2nd number:'
  when 3
    prompt 'Please enter the 3rd number:'
  when 6
    prompt 'Please enter the last number:'
  else
    prompt "Please enter the #{count}th number"
  end

  number = gets.chomp

  until valid_integer?(number)
    puts prompt 'Please enter an integer:'
    number = gets.chomp
  end

  count < 6 ? numbers << number.to_i : search_number = number.to_i
end

if numbers.include?(search_number)
  puts "The number #{search_number} does appear in #{numbers}."
else
  puts "The number #{search_number} does not appear in #{numbers}."
end
