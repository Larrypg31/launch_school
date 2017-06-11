def word_cap(string)
  string.downcase!
  string.split.map(&:capitalize).join(' ')
end

def build_case_match
  lowercase = ('a'..'z').map { |e| e }
  uppercase = ('A'..'Z').map { |e| e }
  hash = {}
  lowercase.each_with_index { |e, idx| hash[e] = uppercase[idx] }
  hash
end

CASE_MATCH = build_case_match

def word_cap_no_cap(string)
  string.downcase!
  array = string.split.map do |word|
    word[0] = CASE_MATCH[word[0]] if CASE_MATCH[word[0]]
    word
  end
  array.join ' '
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

p word_cap_no_cap('four score and seven') == 'Four Score And Seven'
p word_cap_no_cap('the javaScript language') == 'The Javascript Language'
p word_cap_no_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
