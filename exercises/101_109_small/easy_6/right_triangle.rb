
def triangle(count)
  count.times do |i|
    spaces = count - i - 1
    puts "#{' ' * (spaces)}#{'*' * (i)}*"
  end
end


triangle(5)
triangle(9)
