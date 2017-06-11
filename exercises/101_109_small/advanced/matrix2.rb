def transpose(matrix)
  p rows = matrix.size - 1 # rows output output size
  p columns = matrix[0].size - 1 # column output
  transposed = []
  0.upto(columns) do |indx| # nested loops to build rows and columns
    transposed << []
    0.upto(rows) do |indx2|
      transposed[indx] << matrix[indx2][indx]
    end
  end
  transposed
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]
