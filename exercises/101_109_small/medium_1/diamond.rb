def diamond(size)
  center = (size / 2).ceil
  size.times do |line|
    distance = (center - line).abs
    stars = size - 2 * distance
    puts ('*' * stars).to_s.center(size)
  end
end

diamond(15)
