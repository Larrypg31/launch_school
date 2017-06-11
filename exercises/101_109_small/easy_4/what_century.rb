def century(year)
  cent = year / 100
  cent += 1 if (year % 100) > 0
  last_digits = cent % 100
  last_digits = last_digits % 10 if last_digits > 13

  cent.to_s << case last_digits
               when 1
                 'st'
               when 2
                 'nd'
               when 3
                 'rd'
               else
                 'th'
               end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10_103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11_201) == '113th'
