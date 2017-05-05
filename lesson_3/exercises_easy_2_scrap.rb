#

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }



p ages.key?("Lily")

=begin
*Starting with this string:

munsters_description = "The Munsters are creepy in a good way."



Convert the string in the following ways (code will be executed on original munsters_description above):

"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

=end
munsters_description = "The Munsters are creepy in a good way."


p munsters_description.capitalize

p munsters_description.swapcase


p munsters_description.downcase

p munsters_description.upcase




ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }


additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

p ages

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match("Dino")


p flintstones= %w(Fred Barney Wilma Betty BamBam Pebbles)

 flintstones.push("Dino", "Hoppy")

 p flintstones


advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0, advice.index('house'))



advice = "Few things in life are as important as house training your pet dinosaur."


p advice.slice(0, advice.index('house'))

p advice

statement = "The Flintstones Rock!"

p statement.count('t')

title = "Flintstone Family Members"

p title.center(40)
