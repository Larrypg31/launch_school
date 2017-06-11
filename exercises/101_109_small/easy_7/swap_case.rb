
def swapcase(string)
  array = string.chars.map do |char|
    if ('A'..'Z').include?(char)
      char.downcase
    elsif ('a'..'z').include?(char)
      char.upcase
    else
      char
    end
  end
  p array.join
end
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
