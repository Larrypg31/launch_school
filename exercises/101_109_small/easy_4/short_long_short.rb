
def short_long_short(s1, s2)
  s1.size < s2.size ? s1 + s2 + s1 : s2 + s1 + s2
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
