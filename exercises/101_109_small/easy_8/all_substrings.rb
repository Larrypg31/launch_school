def substrings(string)
  string.chars.map.with_index do |_, idx|
    sub_array = string.chars[idx..string.length]
    sub_array.map.with_index.map do |_, i|
      sub_array[0..i].join
    end
  end.flatten
end

p substrings('abcde') == %w(
  a ab abc abcd abcde
  b bc bcd bcde
  c cd cde
  d de
  e
)
