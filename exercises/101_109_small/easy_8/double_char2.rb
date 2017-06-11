CONSONANTS = /[a-zA-z&&[^aeiouAEIOU]]/

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

def double_consonants(string)
  results = ''
  string.each_char do |chr|
    results << chr
    results << chr if CONSONANTS.match(chr)
  end
  results
end

p double_consonants('String') == 'SSttrrinngg'
p double_consonants('Hello-World!') == 'HHellllo-WWorrlldd!'
p double_consonants('July 4th') == 'JJullyy 4tthh'
p double_consonants('') == ''
