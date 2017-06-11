def find_fibonacci_index_by_length(length)
  count = 1
  prev_num = 0
  curr_num = 1
  digits = curr_num.to_s.size

  until digits >= length
    old_num = curr_num
    curr_num += prev_num
    prev_num = old_num
    count += 1
    digits = curr_num.to_s.size
  end
  count
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
