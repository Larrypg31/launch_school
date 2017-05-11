
# Exercise 1

p arr = ['10', '11', '9', '7', '8'].sort do |a, b|
  a.to_i <=> b.to_i
end

# Exercise 2 order from the earlies to the latest

books = [
  { title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925' },
  { title: 'War and Peace', author: 'Leo Tolstoy', published: '1869' },
  { title: 'Ulysses', author: 'James Joyce', published: '1922' }
]

p books.sort_by { |book| book[:published] }

# Exercise 3 For each of these collection objects demonstrate how you would reference the letter 'g'.
p "exercise 3"

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

p arr1[2][1][3]

arr2 = [{ first: ['a', 'b', 'c'], second: ['d', 'e', 'f'] }, { third: ['g', 'h', 'i'] }]

p arr2[1][:third][0]

arr3 = [['abc'], ['def'], { third: ['ghi'] }]

p arr3[2][:third][0][0]

hsh1 = { 'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i'] }

p hsh1['b'][1]

hsh2 = { first: { 'd' => 3 }, second: { 'e' => 2, 'f' => 1 }, third: { 'g' => 0 } }

p hsh2[:third].keys[0]

# Excersise 4 For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr1[1][1] = 4

p arr1

arr2 = [{ a: 1 }, { b: 2, c: [7, 6, 5], d: 4 }, 3]

arr2[2] = 4
p arr2

hsh1 = { first: [1, 2, [3]] }

hsh1[:first][2][0] = 4

p hsh1

hsh2 = { ['a'] => { a: ['1', :two, 3], b: 4 }, 'b' => 5 }

hsh2[['a']][:a][2] = 4
p hsh2

# Exercise 5 figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

total_age_male = 0

munsters.each_value do |hsh|
  total_age_male += hsh["age"] if hsh["gender"] == "male"
end

p total_age_male

# Exercise 6 Given this previously seen family hash, print out the name, age and gender of each family member:

munsters.each { |name, details| puts "#{name} is a #{details['age']}-year-old #{details['gender']}." }

# Exercise 7 Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# Answer
# arr= [a,b] == [2,[5,8]]

# arr[0]+=2 == [4,[5,8]]

# arr[1][0] -= a == [4,[3,8]]b

# a would be 2
# b would be [3,8]
# reason is b points to the array the numbers are held in and a points to an integer.  When the integer in the arr[0] is changed a and the arr[0] are pointing to different objects.  Where b and arr[1] are both point at the same object.

# Exercise 8
# Using the each method, write some code to output all of the vowels from the strings.

hsh = { first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog'] }

vowels = %w(a e i o u)
hsh.each do |_, words_arr|
  words_arr.each do |word|
    word.chars.each do |char|
      puts char if vowels.any? { |vowel| vowel == char }
      # puts char if vowels.include(char)
    end
  end
end

# Exercise 9 Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |element|
  element.sort { |a, b| b <=> a }
end

p new_arr

# Exercise 10

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr = [{ a: 1 }, { b: 2, c: 3 }, { d: 4, e: 5, f: 6 }]

new_arr = []
new_arr = arr.map do |hsh|
  updated_hash = {}
  hsh.each { |k, v| updated_hash[k] = v + 1 }
  updated_hash
end

puts "new"
p new_arr
puts "old"
p arr

# Exercise 11
# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_array|
  p sub_array.select { |num| num % 3 == 0 }
end

puts "new"
p new_arr
puts "old"
p arr

# Exercise 12 Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', { c: 3 }], [{ a: 1, b: 2, c: 3, d: 4 }, 'D']]

hsh = {}
arr.each do |element|
  key = element[0]
  value = element[1]
  hsh[key] = value
end

p hsh

# Exercise 13 Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically according to the numeric value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort! do |x, y|
  a = x.select(&:odd?)
  b = y.select(&:odd?)
  a <=> b
end

p arr

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by! do |sub_array|
  sub_array.select(&:odd?)
end

p arr

# Exercise 14 Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => { type: 'fruit', colors: ['red', 'green'], size: 'small' },
  'carrot' => { type: 'vegetable', colors: ['orange'], size: 'medium' },
  'apple' => { type: 'fruit', colors: ['red', 'green'], size: 'medium' },
  'apricot' => { type: 'fruit', colors: ['orange'], size: 'medium' },
  'marrow' => { type: 'vegetable', colors: ['green'], size: 'large' }
}
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

new_arr = hsh.map do |_, details|
  if details[:type] == "fruit"
    details[:colors].map(&:capitalize)
  elsif details[:type] == "vegetable"
    details[:size].upcase
  end
end

p new_arr

# Exercise 15 Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{ a: [1, 2, 3] }, { b: [2, 4, 6], c: [3, 6], d: [4] }, { e: [8], f: [6, 10] }]

new_arr = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all?(&:even?)
  end
end
p new_arr

def generator_UUID
  characters = []
  (1..9).each { |v| characters << v.to_s }
  ('a'..'f').each { |v| characters << v }

  uuid = ""

  [8, 4, 4, 4, 12].each do |digits|
    digits.times { uuid << characters.sample }
    uuid << "-"
  end
  #slice to remove trailing "-"
  uuid.slice!(-1)
  uuid

end

p generator_UUID

#
