require 'pry'
def prompt(msg)
  puts "=> #{msg}"
end

SUITS = %w[♠ ♦ ♥ ♣]
CARD_NAMES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]

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

def update_total_value(cards)
  up_cards = cards.select do |card|
    card[:view] == "up"
  end
  values = up_cards.map do |card|
    card[:value]
  end
  total = values.reduce(:+)

  values.select { |value| value == 11 }.count.times do
    total -= 10 if total > 21
  end
  total
end

def display_hand_status(player)
  total = player[:total_value]
  status = player[:status]
  score = player[:score]

  puts "     -------------------"
  puts "         Showing #{total} "
  puts ""
  puts "         #{status}"
  puts ""
  if score == 1
    puts "      Has won #{score} round"
  else
    puts "      Has won #{score} rounds"
  end
  puts "     -------------------"
  puts ""
end

# rubocop:disable Metrics/MethodLength
def build_card_display(card)
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

def build_down_card_display
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

def display_hand(hand)
  hand_output = []
  hand.each do |card|
    hand_output << if card[:view] != 'down'
                     build_card_display(card)
                   else
                     build_down_card_display
                   end
  end
  hand_output[0].each_with_index do |_, idx|
    lineoutput = ''
    hand_output.each do |card|
      lineoutput << card[idx]
    end
    puts lineoutput
  end
end

def update_hand(hand, shoe, view ="up")
  card = shoe.shift
  card[:value] = CARD_VALUES[card[:name]]
  card[:view] = view
  hand << card
end

def initial_hand(player_hand, dealer_hand, shoe)
  2.times do |i|
    update_hand(player_hand, shoe)
    # sets dealer first card to down view
    view = i == 0 ? "down" : "up"
    update_hand(dealer_hand, shoe, view)
  end
end

# Gameboard
def display_table(details)
  system "clear"
  details[:players].each do |player|
    player[:total_value] = update_total_value(player[:hand])
    puts "        --- #{player[:name]} ---"
    display_hand(player[:hand])
    display_hand_status(player)
    puts ""
  end
end

def busted?(value)
  value > 21
end

def init_game(shoe)
  shuffle_shoe(shoe)
end

def valid_answer?(valid, answer)
  valid.include?(answer[0])
end

def init_round(player_details, dealer_details)
  player_details[:status] = "Your Turn"
  player_details[:hand] = []
  player_details[:total_value] = 0
  dealer_details[:status] = "Waiting"
  dealer_details[:hand] = []
  dealer_details[:total_value] = 0
end

def detect_results(player, dealer)
  if player[:status] == "Busted"
    dealer[:score] += 1
    "Dealer Wins!"
  elsif dealer[:status] == "Busted"
    player[:score] += 1
    "Player Wins!"
  elsif dealer[:total_value] > player[:total_value]
    dealer[:score] += 1
    "Dealer Wins!"
  elsif dealer[:total_value] < player[:total_value]
    player[:score] += 1
    "Player Wins!"
  else
    "It's a tie"
  end
end

player_details = {
  name: "Player",
  status: "Your Turn", # can be 21,bust,waiting
  hand: [],
  total_value: 0,
  score: 0
}

dealer_details = {
  name: "Dealer",
  status: "Waiting",
  hand: [],
  total_value: 0,
  score: 0
}

game_details = {
  players: [dealer_details, player_details]
}
system 'clear'
puts "Welcome to Black Jack!"
puts "The cards to be dealt are called a shoe."
puts "The game will automatically refresh the shoe once it gets below 65%"
puts ""
puts  "Black Jack is typically played with multiple decks."
puts  "Casinos typically play with 6-8 decks."
puts ""

number_of_decks = 1
loop do
  prompt "How many decks would you like to play with? Choose (1 - 10)"
  answer = gets.chomp.to_i
  number_of_decks = answer
  break unless !(1..10).cover?(answer)
  prompt "Please, pick a number between 1 and 10."
end

shoe = build_shoe(number_of_decks)
init_game(shoe)
loop do # round loop
  init_round(player_details, dealer_details)

  if shoe.size < (52 * number_of_decks) * 0.35
    shoe = build_shoe(number_of_decks)
    shuffle_shoe(shoe)
  end
  player_hand = player_details[:hand]
  dealer_hand = dealer_details[:hand]
  initial_hand(player_hand, dealer_hand, shoe)
  display_table(game_details)

  loop do # User Hit loop
    player_details[:status] = "Busted" if busted?(player_details[:total_value])

    break if player_details[:status] == "Busted" || \
             player_details[:total_value] == 21

    prompt "Would you like to (h)it or (s)tay?"
    prompt "Enter the letter inside the () to make your choice"
    answer = gets.chomp
    if valid_answer?(%w[h s], answer)
      break unless answer.downcase.start_with?('h')
      puts "Dealing Card"
      sleep 1 # Pause for suspense
      update_hand(player_hand, shoe)
      display_table(game_details)
    else
      prompt "Please choose a valid option!"
    end
  end

  dealer_hand[0][:view] = 'up'
  player_details[:status] = "Waiting" unless \
                                    player_details[:status] == "Busted"
  dealer_details[:status] = "Dealer's Turn"
  display_table(game_details)

  loop do # Dealer Hit loop
    display_table(game_details)
    dealer_details[:status] = "Busted" if \
                              busted?(dealer_details[:total_value])

    break if dealer_details[:total_value] >= 17 || \
             player_details[:status] == "Busted"

    sleep 1
    puts "Dealer is taking a hit!"
    update_hand(dealer_hand, shoe)
  end
  dealer_details[:status] = "Busted" if busted?(dealer_details[:total_value])

  results = detect_results(player_details, dealer_details)
  display_table(game_details)
  puts results
  if player_details[:score] == 5
    puts "Player won 5 rounds first"
    puts "Score will reset"
    dealer_details[:score] = 0
    player_details[:score] = 0
  elsif dealer_details[:score] == 5
    puts "The dealer won 5 rounds first"
    puts "Score will reset"
    dealer_details[:score] = 0
    player_details[:score] = 0
  end
  answer = nil
  loop do # Continue playing?
    prompt "Would you like to play another round? (y/n)"
    answer = gets.chomp
    break unless !valid_answer?(%w[y n], answer)
    prompt "Please Choose a valid answer!"
  end
  break if answer.downcase.start_with?('n')
end
