=begin def merge_sort(array)
  return array if array.size == 1

  half = array.size/2
  sub_arr = array[0..half]
  sub_arr2 = array[half..-1]

  sub_arr1 = merge_sort(sub_arr1)
  sub_arr2 = merge_sort(sub_arr2)

  merge(sub_arr1, sub_arr2)

end
=end
def merge(arr1,arr2)
  n_of_elements = arr1.size + arr2.size
  idx1 = 0
  idx2 = 0
  result = []
  1.upto(n_of_elements) do
    case
    when !arr1[idx1]
      result << arr2[idx2]
      idx2 += 1
    when !arr2[idx2]
      result << arr1[idx1]
      idx1 += 1
    when arr1[idx1] < arr2[idx2]
      result << arr1[idx1]
      idx1 += 1
    else
      result << arr2[idx2]
      idx2 += 1
    end
  end
  result
end

def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end





p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
[1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
