def my_method(array)
  if array.empty?
    []
  elsif array.size > 1  # There wa no condition for the elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
