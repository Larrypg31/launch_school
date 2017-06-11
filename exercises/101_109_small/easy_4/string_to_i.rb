
def build_s_to_i
  list = {}
  count = 0
  ('0'..'9').each do |s|
    list[s] = count
    count += 1
  end
  list
end

S_to_I = build_s_to_i

def string_to_integer(string)

  size = string.size - 1
  number = 0
  string.each_char do |char|
     number += S_to_I[char] * (10 ** size)
     size -= 1
  end
  number
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
