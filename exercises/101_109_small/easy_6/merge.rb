def merge(* arrays)
  new_array = []
  arrays.each do |arr|
    arr.each {|e| new_array << e if !new_array.include?(e)}
  end
  p new_array
  new_array

end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
