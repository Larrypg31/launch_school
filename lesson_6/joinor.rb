def prompt(msg)
  puts "=>#{msg}"
end

def joinor(empty_squares, connective_1=', ', connective_2='or')
  choices = empty_squares.join(connective_1)
  choices[-3] = " #{connective_2}" if choices.length > 2
  choices
end

prompt "Choose Square (#{joinor([4], '; ', 'and')})"

prompt joinor([1, 2]) # => "1 or 2"
prompt joinor([1, 2, 3])              # => "1, 2, or 3"
prompt joinor([1, 2, 3], '; ')        # => "1; 2; or 3"
prompt joinor([1, 2, 3], ', ', 'and') # => "1, 2, and 3"



  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
