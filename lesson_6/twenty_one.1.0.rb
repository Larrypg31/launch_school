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

number_of_decks = 1

# Black Jack is typically played with multiple decks of cards.
# I am setting it up to make this an option.

# Shoe is the term used for the cards to be dealt.
# We will rebuild and reshuffle shoe went the amount of cards
# left in the deck is < 25%
def build_shoe(num_of_decks)
  shoe = []
  num_of_decks.times do |_|
    DECK_OF_CARDS.each do |v|
      shoe << v
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



def dispaly_status(status)
  puts "     -------------------"
  puts "       |  #{number} |"
  puts "     -------------------"
  puts ""
end

def display_busted
  puts "     -------------------"
  puts "          | Busted |"
  puts "     -------------------"
  puts ""
end



# Output of display
def display_board(dealer,player)
  system 'clear'
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

def sum_of(card_values)
  total = card_values.reduce(:+)
  if bust?(total) && card_values.index(11)
    card_values[card_values.index(11)] = 1
    total = values.reduce(:+)
  end
  total
end


player_details={
}
dealer_details={}
display_details=[]


loop do # game loop



playagain?
end








prompt "Thank You for playing Black Jack"
