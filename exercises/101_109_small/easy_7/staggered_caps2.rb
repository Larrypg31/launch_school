def staggered_case(string)
  upper = true
  result = ''

  string.chars.each do |char|
    if char =~ /[a-z]/i # is the character an alpha character?
      if upper
        result <<  char.upcase
      else
        result << char.downcase
      end
      upper = !upper
    else
      result << char
    end
  end
  p result
end
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
