def substrings_at_start(string)
  string.chars.map.with_index do |_, idx|
    string.chars[0..idx].join
  end
end

def substrings(string)
  string.chars.map.with_index do |_, idx|
    substrings_at_start(string[idx..string.size]).flatten
  end.flatten
end

def palindromes(string)
  substrings(string).select do |substring|
    substring == substring.reverse && substring.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == %w(madam ada)
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == %w(
  nittin itti tt ss settes ette tt
)
