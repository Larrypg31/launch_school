def ascii_value(string)
  if string.empty?
    0
  else
    string.chars.map(&:ord).inject(:+)
 end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
