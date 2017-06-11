
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


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
