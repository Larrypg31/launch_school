# Lettercase Percentage Ratio

def letter_percentages(string)
  total_chars = string.size
  lowercase = string.count('a-z') / total_chars.to_f * 100
  uppercase = string.count('A-Z') / total_chars.to_f * 100
  neither = 100 - (lowercase + uppercase).to_f

  hash =  {
    lowercase: lowercase,
    uppercase: uppercase,
    neither: neither
  }

end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
