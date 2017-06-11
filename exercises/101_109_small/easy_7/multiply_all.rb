def multiply_all_pairs(arr1, arr2)
  product = arr1.map do |num1|
    arr2.map do |num2|
      num1 * num2
    end
  end
  product.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
