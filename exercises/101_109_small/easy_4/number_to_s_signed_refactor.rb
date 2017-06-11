
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
  prfx = case integer <=> 0
         when 1
           '+'
         when -1
           '-'
         else
           nil
  end
  string = integer_to_string(integer.abs)
  string.prepend(prfx) unless prfx == nil
  string

end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
