def conc_arr(arr)
  string = ''
  arr.each_with_index do |word, indx|
    string << word
    string << ' ' if indx != arr.length
  end
  string
end

puts conc_arr(%w(my great wonderful array string'))

def every_other(array)
  new_array = []
  array.each_with_index do |value, indx|
    new_array << value if indx.even?
  end
  new_array
end

puts every_other([0, 1, 2, 3, 4, 5, 6, 7, 8])
