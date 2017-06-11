require 'date'

def friday_13th(year)
  slasher_day_count = 0
  (1..12).each do |month|
    slasher_day_count += 1 if Date.new(year, month, 13).friday?
  end
  slasher_day_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
