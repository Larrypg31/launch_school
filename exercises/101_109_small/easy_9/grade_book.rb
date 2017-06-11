def get_grade(* grades)
  avg = grades.inject(:+) / grades.size
  case avg
  when (0..59)   then 'F'
  when (60..69)  then 'D'
  when (70..79)  then 'C'
  when (80..89)  then 'B'
  else                'A'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(90, 90, 90)
p get_grade(90, 95, 100, 105, 150)
