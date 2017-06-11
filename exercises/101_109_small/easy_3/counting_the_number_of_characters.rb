def prompt(msg)
  puts ">> #{msg}"
end

prompt 'Please write a word or multiple words:'

words = gets.chomp

prompt "There are #{words.delete(' ').size} characters in \"#{words}\"."
