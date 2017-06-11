
def transpose(matrix)
  matrix.map.with_index do |sub_a, idx|
    sub_a.map.with_index do |_, idx2|
      matrix[idx2][idx]
    end
  end
end

def transpose!(matrix)

end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
