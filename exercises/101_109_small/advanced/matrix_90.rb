
def rotate90(matrix)
  rows = matrix.size - 1
  columns = matrix[0].size - 1
  transposed = []
  0.upto(columns) do |indx| # nested loops to build rows and columns
    transposed << []
    rows.downto(0) do |indx2|
      transposed[indx] << matrix[indx2][indx]
    end
  end

  p transposed
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
