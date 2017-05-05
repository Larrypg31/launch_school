
# 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

p flintstones.each_with_index { |v, indx| flintstones_hash[v] = indx }

p flintstones_hash

# 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = 0
ages.each { |_, v| total_age += v }

p total_age

#3
# could have used keep_if to keep anyone < 100

ages.delete_if { |k,v| v >= 100 }

p ages


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

 #4
ages.values.min


#5 Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |v| v[0,2] == "Be"  }

 #6

 flintstones.each_with_index do |v,indx|
   flintstones[indx]=v.split('').first(3).join
 end
 p flintstones

#better
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0,3] }


#7
statement = "The Flintstones Rock"

occurences={}
statement.split('').each do |v|
  if v!= ' ' then occurences[v] ? occurences[v]+=1 : occurences[v]=1 end

end
puts "occurences"
p occurences

 ## what they were looking for... Map out the letters  to an array and count them
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

#8 What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
puts "numbers"
p numbers
puts "----"
# Answer: This code would output each number but the array would be an empty array when the code is complet

# My answer is wrong after reviewing the solution I realize after each pass the loop iteration reduces with the array so the block is only performed on the first 2 iterations.  after the first pass the new total iterations is 3 with 1 iteration completed, after second pass the new total iterations is 2 with the both already completed

#What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

p numbers
#considering the first part of the question it should output 1,2 and leave the array [1,2]
#


# 9 Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below




munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
puts "munsters ages"
munsters.each do |k,v|
  if munsters[k]['age'] > 64
    munsters[k]['age_group']="senior"
  elsif munsters[k]['age'] >= 18
    munsters[k]['age_group']="adult"
  else
      munsters[k]['age_group']="kid"
    end
end

p munsters

## other solution after reading the hin

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name ,details|
  case details['age']
  when (1..17)
    details['age_group']="kid"
  when (18..64)
    details['age_group']="adult"
  else
    details['age_group']="senior"
  end
end
puts "munsters rehashed ------"
p munsters














#
