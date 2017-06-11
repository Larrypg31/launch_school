def reverse!(list)
  moves = (list.size / 2).floor

  moves.times do |count|
    left_index = count
    right_index = -1 - count
    list[left_index], list[right_index] = list[right_index], list[left_index]
  end

  list
end

p list = [1, 2, 3, 4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

p list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == %w(e d c b a)

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ['abc']

p list = []
p reverse!(list) # => []
p list == []
