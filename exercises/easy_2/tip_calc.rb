def prompt(msg)
  puts "=> #{msg}"
end


puts "Welcome to my tip calculator."
puts ""
prompt ("What is the total bill amount?")
bill_amount=gets.chomp.to_f
prompt ("Please enter tip percentage")
percentage=gets.chomp.to_f

percentage /= 100
tip_amount= (percentage * bill_amount).round(2)



puts "You should tip $#{sprintf('%.2f', tip_amount)} on a $#{sprintf('%.2f', bill_amount)} to tip " \
      "#{percentage * 100}%"
