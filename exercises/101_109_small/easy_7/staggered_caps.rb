def staggered_case(string)
  string_array = string.chars.map.with_index do |e, i|
    if i.even?
      e.capitalize
    else
      e.downcase
    end
  end
  p string_array.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
