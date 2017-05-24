def prompt(msg)
  puts "=> #{msg}"
end

def square(length, width)
  sqr = length * width
  sqr.round(2)
end

def to_feet(sq_meters)
  sqr = sq_meters * 10.7639
  sqr.round(2)
end
prompt("We are going to calculate square meters and feet of a room.")
prompt("Please enter the length of the room in meters")

length = gets.chomp.to_f
prompt("Please enter the width of the room in meters")

width = gets.chomp.to_f

prompt "The area of the room is #{square(length, width)} square meters" \
       "#{to_feet(square(length, width))} square feet."
