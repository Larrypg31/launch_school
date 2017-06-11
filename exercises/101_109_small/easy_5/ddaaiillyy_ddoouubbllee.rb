
def crunch(string)
  newstring = string.chars.select.with_index do |char,idx|
    char != string[idx + 1]
  end
  newstring.join
end



p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
