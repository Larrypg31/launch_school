def horizontal_line(size, char)
  size.times {print char}
end

def print_in_box(string)

  h_size = string.size + 2
  h_rule = "+#{'-' * (h_size)}+"
  empty_line = "|#{' ' * (h_size)}|"
  puts h_rule
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts h_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
