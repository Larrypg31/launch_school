
amt = ''
j = ''
n = ''
# Spacer
def hr
  puts("--------------------------------------------------------------")
end

def prompt(message)
  puts("=> #{message}")
  hr
end

# User verify info is correct
def user_verify(answer)
  answer.downcase!
  if answer.start_with?('y')
    return true
  else
    return false
  end
end

# monthly Rate
def calculate_monthly_rate(apr)
  mpr = apr.to_f / 12
  mpr / 100
end

def round_money(number)
  mult = number * 100
  x = mult.round
  x / 100.to_f
end

# Calculate Payment  Note: In a
def calculate_pymnt(amt, j, n)
  x = amt.to_f * (j.to_f / (1 - (1 + j.to_f)**-n.to_f))
  round_money(x)
end

# Validation
def valid_num?(number, msg)
  if number.to_f != 0 && (number.to_f.to_s == number ||
    number.to_i.to_s == number)
    true
  else
    prompt("#{number} is not a valid #{msg}!")
  end
end

prompt("Welcome to the auto/mortgage loan monthly payment calculator!")
prompt("Please Enter your name")
name = gets.chomp

loop do
  prompt("To calculate your loan monthly payment you will need the loan amount,
   the Annual Percentage Rate (APR) and the loan duration in months")

  loop do
    prompt("Please enter your loan amount: ")
    amt = gets.chomp
    if valid_num?(amt, 'Loan amount')
      prompt("Your loan amt is $#{amt}. Is this correct (Y/N)")
      break if user_verify(gets.chomp)
      prompt("Please provide the correct loan amount!")
    end
  end

  loop do
    prompt("Please provide your annual percentage rate (APR).
    example 2.99 for 2.99%")
    apr = gets.chomp

    if valid_num?(apr, "APR")
      j = calculate_monthly_rate(apr)
      prompt("Your loan APR is #{apr}%. Is this correct (Y/N)")
      break if user_verify(gets.chomp)
      prompt("Please provide the correct APR!")
    end
  end

  loop do
    prompt("Please provide your loan duration in months")
    n = gets.chomp
    if valid_num?(n, "Loan Duration")
      prompt("Your loan is for #{n} months. Is this correct (Y/N)")
      break if user_verify(gets.chomp)
      prompt("Please provide the correct amount of months!")
    end
  end

  m = calculate_pymnt(amt, j, n)
  prompt("#{name} your monthly pymnt is #{m}")
  prompt("Would you like to calculate another loan? (Y/N)")
  answer = gets.chomp
  answer = answer.downcase
  break if answer.start_with?('n')
end
