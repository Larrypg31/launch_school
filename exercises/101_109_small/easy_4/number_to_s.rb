
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

def integer_to_string(integer)
  string = ''
  power = 10
  loop do
    digit = integer % 10
    integer /= 10
    string.insert(0, S_to_I.key(digit))
    break if integer == 0
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
