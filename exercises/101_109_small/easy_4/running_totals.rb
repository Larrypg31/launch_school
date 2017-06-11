
def running_total(arr)
  arr.map!.with_index do |e, idx|
    idx > 0 ? e + arr[idx - 1] : e
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

def running_totali(arr)
  arr.map.with_index do |_, index|
    arr[0..index].inject(:+)
  end
end

p running_totali([2, 5, 13]) == [2, 7, 20]
p running_totali([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_totali([3]) == [3]
p running_totali([]) == []
