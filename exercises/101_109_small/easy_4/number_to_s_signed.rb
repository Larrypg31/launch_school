
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
    integer, digit = integer.divmod(10)
    string.insert(0, S_to_I.key(digit))
    break if integer == 0
  end
  string
end

def signed_integer_to_string(integer)
  case integer <=> 0
  when 1
    integer_to_string(integer).prepend('+')
  when -1
    integer_to_string(integer * -1).prepend('-')
  else
    integer_to_string(integer)
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
