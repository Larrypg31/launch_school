require 'pry'
def prompt(msg)
  puts "=> #{msg}"
end

SUITS = %w[♠ ♦ ♥ ♣]
CARD_NAMES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
DEALERSTAY = 17

def build_card_value(name, value, other_value = nil)
  {
    name: name,
    value: value,
    other_value: other_value
  }
end

def card_values
  card_values = {}
  CARD_NAMES.each do |name|
    card_values[name] =
      if name == 'Ace'
        11
      elsif name.to_i.to_s == name
        name.to_i
      else
        10
      end
  end
  card_values
end

# hash to be able to search the values without having duplicates.
# Since the suit is not important for this purpose
CARD_VALUES = card_values

def build_deck
  deck = []
  SUITS.each do |suit|
    CARD_NAMES.each do |name|
      deck << { name: name, suit: suit }
    end
  end
  deck
end

DECK_OF_CARDS = build_deck
# Shoe is the term used for the cards to be dealt.
# We will rebuild and reshuffle shoe went the amount of cards
# left in the deck is < 25%
def build_shoe(num_of_decks)
  shoe = []
  num_of_decks.times do |_|
    DECK_OF_CARDS.select do |card|
      shoe << card
    end
  end
  shoe
end

# Shuffle 7 times
def shuffle_shoe(shoe)
  7.times { shoe.shuffle! }
end
# Disable rubocop do to output is for printing to screen

def build_down_card
  line = []
  line[0] = ""
  line[1] = "    o-------o"
  line[2] = "    |~~~~~~~|"
  line[3] = "    |~~~~~~~|"
  line[4] = "    |~~~~~~~|"
  line[5] = "    |~~~~~~~|"
  line[6] = "    |~~~~~~~|"
  line[7] = "    o-------o"
  line[8] = ""
  line
end

# rubocop:disable Metrics/MethodLength
def build_card(card)
  cardname = if card[:name] == card[:name].to_i.to_s
               card[:name]
             else
               card[:name].chr
             end
  line = []
  line[0] = ""
  line[1] = "    o-------o"
  line[2] = "    |       |"
  line[3] = "    |   #{cardname}  |"
  line[3] = "    |   #{cardname}   |" unless cardname.size > 1
  line[4] = "    |       |"
  line[5] = "    |   #{card[:suit]}   |"
  line[6] = "    |       |"
  line[7] = "    o-------o"
  line[8] = ""
  line
end
# rubocop:enable Metrics/MethodLength

def display_hand(cards, down_card = true)
  hand_output = []
  cards.each do |card|
    hand_output << build_card(card)
  end
  hand_output[0] = build_down_card if down_card == true

  hand_output[0].each_with_index do |_, idx|
    lineoutput = ''
    hand_output.each do |card|
      lineoutput << card[idx]
    end
    puts lineoutput
  end
end

def deal_card(hand, shoe, values)
  card = shoe.shift
  hand << card
  values << CARD_VALUES[card[:name]]
end

def initial_deal(shoe, player_hand, p_values, dealer_hand, d_values)
  2.times do |_|
    deal_card(player_hand, shoe, p_values)
    deal_card(dealer_hand, shoe, d_values)
  end
end

def display_total(number)
  puts "     -------------------"
  puts "       |  Showing #{number} |" if number <= 21
  puts "          | Busted |" if number > 21
  puts "     -------------------"
  puts ""
end

def display_board(dealer_hand, player_hand, player_values, dealer_values, \
                  dealer_down = true)
#  system 'clear'
  puts ""
  puts "       ----Dealer----"
  display_hand(dealer_hand, dealer_down)
  if dealer_down
    display_total(dealer_values[1])
  else
    display_total(sum_of(dealer_values))
  end
  puts ""
  puts "       ----Player----"
  display_hand(player_hand, false)
  display_total(sum_of(player_values))
end

def sum_of(values)
  total = values.reduce(:+)
  if bust?(total) && values.index(11)
    values[values.index(11)] = 1
    total = values.reduce(:+)
  end
  total
end

def valid_answer?(valid, answer)
  valid.include?(answer[0])
end

def bust?(num)
  num > 21
end

def dealer_hit?(values)
  sum_of(values) < 17
end

def check_winner(dealer, player)
  player_total = sum_of(player)
  dealer_total = sum_of(dealer)
  if bust?(dealer_total)
    "Player Wins!"
  elsif bust?(player_total)
    "Dealer Wins!"
  elsif dealer_total > player_total
    "Dealer Wins!"
  elsif dealer_total < player_total
    "Player Wins!"
  else
    "It's a Push!"
  end
end

# Initialize variables for game
system 'clear'

prompt "Welcome to Black Jack!"
prompt "The cards to be dealt are called a shoe."
prompt "The game will automatically refresh the shoe once it gets below 65%"
prompt ""
prompt "Black Jack is typically played with multiple decks."
prompt "Casinos typically play with 6-8 decks."
puts ""

number_of_decks = 1
loop do


p DECK_OF_CARDS
  prompt "How many decks would you like to play with? Choose (1 - 10)"
  answer = gets.chomp.to_i
  number_of_decks = answer
  break unless !(1..10).cover?(answer)
  prompt "Please, pick a number between 1 and 10."
end

shoe = build_shoe(number_of_decks)
shuffle_shoe(shoe)

loop do # Game Loop
  if shoe.size < (52 * number_of_decks) * 0.35
    shoe = build_shoe(number_of_decks)
    shuffle_shoe(shoe)
  end


  p DECK_OF_CARDS

  player_hand = []
  player_values = []
  dealer_hand = []
  dealer_values = []

  initial_deal(shoe, player_hand, player_values, dealer_hand, dealer_values)
  display_board(dealer_hand, player_hand, player_values, dealer_values)

  loop do # Hit loop user
    break if bust?(sum_of(player_values)) || sum_of(player_values) == 21
    prompt "Would you like to (h)it or (s)tay"
    prompt "Enter the letter inside the () to make your choice"
    answer = gets.chomp

    if valid_answer?(%w[h s], answer)
      break if answer.downcase.start_with?('s')
      deal_card(player_hand, shoe, player_values)
      display_board(dealer_hand, player_hand, player_values, dealer_values)
    else
      prompt "Please choose a valid option!"
    end
  end



  loop do # dealer hit loop

    display_board(dealer_hand, player_hand, player_values, dealer_values, false)
    break if bust?(sum_of(player_values))
      sleep 3
    break unless dealer_hit?(dealer_values)
    deal_card(dealer_hand, shoe, dealer_values)
    display_board(dealer_hand, player_hand, player_values, dealer_values, false)
  end
  puts check_winner(dealer_values, player_values)
  puts "You had #{sum_of(player_values)}"
  puts "Dealer had #{sum_of(dealer_values)}"

  answer = nil
  loop do # Continue playing?
    prompt "Would you like to play another round? (y/n)"
    answer = gets.chomp
    break unless !valid_answer?(%w[y n], answer)
    prompt "Please Choose a valid answer!"
  end
  break if answer.downcase.start_with?('n')
end

prompt "Thank You for playing Black Jack"
