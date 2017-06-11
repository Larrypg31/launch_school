def interleave(arr1, arr2)
  combined_array = []
  arr1.size.times do |i|
    combined_array << arr1[i] << arr2[i]
  end
  combined_array
end


def interleave_zip(arr1,arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], %w(a b c)) == [1, 'a', 2, 'b', 3, 'c']

p interleave_zip([1, 2, 3], %w(a b c)) == [1, 'a', 2, 'b', 3, 'c']
