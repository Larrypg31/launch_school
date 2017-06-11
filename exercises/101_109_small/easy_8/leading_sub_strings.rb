def substrings_at_start(string)
  string.chars.map.with_index do |_, idx|
    string.chars[0..idx].join
  end
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
