
def prompt (msg)
  puts ">> #{msg}"
end

prompt "Please enter a noun."

noun = gets.chomp

prompt "Please enter a verb."
verb = gets.chomp

prompt "Please enter an adverb"
adverb = gets.chomp

prompt "Please enter an adjective"
adjective = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

paragraph = [s1,s2,s3]

puts paragraph
