def horizontal_line(size, char)

  size.times {print char}

end

def print_in_box(string)
  h_size = string.size
  print "+-"
  horizontal_line(h_size,"-")
  print "-+ \n"
  print "| "
  horizontal_line(h_size,' ')
  print " | \n"
  print "| #{string} |\n"
  print "| "
  horizontal_line(h_size," ")
  print " | \n"
  print "+-"
  horizontal_line(h_size,"-")
  print "-+ \n"





end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
