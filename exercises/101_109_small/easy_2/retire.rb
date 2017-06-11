=begin
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

def prompt(msg)
  puts "=>#{msg}"
end

prompt("What is your current age?")
age = gets.chomp.to_i

prompt("What age would you like to retire?")
retire_age=gets.chomp.to_i

current_year = Time.new.year

time_until_retire = retire_age - age

retire_year = current_year + time_until_retire

puts "It's #{current_year}. You will retire in #{retire_year}. " \
      "You have only #{time_until_retire} years of work to go!"
