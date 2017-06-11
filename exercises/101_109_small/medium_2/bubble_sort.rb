def bubble_sort!(array)
  loop do
    swapped = false
    n = 2
    0.upto(array.size - n) do |idx|
       next if array[idx] <= array[idx + 1]
       array[idx], array[idx + 1]= array[idx + 1], array[idx]
       swapped = true
    end
    n +=1 #reduces the last element looked at by 1 with each pass
    break unless swapped
  end
end



p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
