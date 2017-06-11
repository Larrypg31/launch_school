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

p substrings('abcde') == %w(
  a ab abc abcd abcde
  b bc bcd bcde
  c cd cde
  d de
  e
)
