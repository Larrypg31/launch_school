# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."


advice.gsub!('important', 'urgent')

puts advice


numbers = [1, 2, 3, 4, 5]

p puts numbers.delete_at(17)

p numbers

numbers = [1, 2, 3, 4, 5,1]

puts
p numbers.delete(17)

p numbers

p ('a'..'z').include?('dd')

p ('a'..'z').cover?('dd')



famous_words = "seven years ago..."

famous_words = "Four scores and #{famous_words}"

p famous_words


famous_words = "seven years ago..."
puts "famous word"
p famous_words.prepend("Four scores and ")
puts famous_words

famous_words = "seven years ago..."
puts "famous word"

famous_words = "Four scores and " + famous_words
puts famous_words



def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval("4 + 2") #just a test




flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

p flintstones
p flintstones.flatten!

p flintstones


flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")


















#
