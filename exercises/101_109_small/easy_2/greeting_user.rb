=begin
What is your name? Bob
Hello Bob.
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

=end



def prompt(msg)
  puts "=>#{msg}"
end

def check_for_punctuation(name)
  if name[-1] == "!"
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}"
  end
end

prompt "What is your name?"
name = gets.chomp
check_for_punctuation(name)
