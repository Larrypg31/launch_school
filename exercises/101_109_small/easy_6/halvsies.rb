def halvsies(array)
  slice_index = (array.size.to_f/2).ceil - 1
  first_half = array.slice(0..slice_index)
  second_half = array.slice(slice_index + 1..-1)
  [first_half,second_half]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
