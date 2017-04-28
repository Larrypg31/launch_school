VALID_CHOICES = %w(rock paper scissors lizard spock)

WHO_DEFEATS_WHO = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['spock', 'paper']

}

SELECTION_ABREVIATIONS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

computer_score = 0
user_score = 0

user_name = ''

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WHO_DEFEATS_WHO[first].include?(second)
end
=begin
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))

end

def display_results(player, computer)
  if player == computer
    prompt("This round is a tie!")
  elsif win?(player, computer)
    prompt("You won this round!")
    "user"
  else
    prompt("The Computer won this round!")
    "computer"
  end

  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end
=end

loop do
  prompt "Please enter your name:"
  user_name = Kernel.gets().chomp()
  break if !user_name.empty?
  prompt "You must enter a name!"
end

loop do
  loop do
    choice = ''
    loop do
      prompt "First one to five wins!"
      prompt("---------------------------------------------")
      prompt "The current score is:"
      prompt "#{user_name}: #{user_score}"
      prompt "Computer: #{computer_score}"
      prompt("---------------------------------------------")
      prompt("Choose one:")
      prompt("---------------------------------------------")
      SELECTION_ABREVIATIONS.each { |k, v| puts "Use #{k} for #{v}." }
      prompt("---------------------------------------------")
      choice = Kernel.gets().chomp()
      prompt("---------------------------------------------")
      if SELECTION_ABREVIATIONS[choice]
        choice = SELECTION_ABREVIATIONS[choice]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    if choice == computer_choice
      prompt "This round is a tie!"
    elsif win?(choice, computer_choice)
      user_score += 1
      prompt "You won this round!"
    else
      prompt "The computer won this round!"
      computer_score += 1
    end

    prompt("---------------------------------------------")

    if user_score == 5
      prompt "You won the game! Live long and prosper!"
      break
    elsif computer_score == 5
      prompt "You lost the game!"
      break
    end
  end
  prompt("---------------------------------------------")
  prompt("The Final score is:")
  prompt("#{user_name}: #{user_score}")
  prompt("Computer: #{computer_score}")
  prompt("---------------------------------------------")

  user_score = 0
  computer_score = 0

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
