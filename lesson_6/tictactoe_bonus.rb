require 'pry'

INITIAL_MARKER = ' '

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

FIRST_TURN = "choose"

FIRST_PLAYER_MARKER = 'X'
SECOND_PLAYER_MARKER = 'O'

PLAYER_MARKER = FIRST_PLAYER_MARKER
COMPUTER_MARKER = SECOND_PLAYER_MARKER

# uses these variables for planning of multiplayer game
player1 = "Player"
player2 = "Computer"

score = { player1 => 0, player2 => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

#### Add all messages to the board so that the clear does not clear messages!
### do you want to automate the drawing of the board?
def display_board(brd, score, message=nil)
  system 'clear'

  prompt "You're an X. Computer is O."

  display_score(score)
  puts ""
  (1..3).each do |num|
    puts "     |     |"
    puts "  #{brd[(num * 3) - 2]}  |  #{brd[(num * 3) - 1]}  |  #{brd[num * 3]}"
    puts "     |     |"
    puts "-----+-----+------" unless num == 3
  end
  puts ""

  display_message(message) if !!message
end
# rubocop:enable Metrics/AbcSize

def initialize_board(score)
  if score.any? { |_, value| value == 5 }
    score.each { |k, _value| score[k] = 0 }
  end

  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def check_5_empty(brd, square)
  5 if !square && empty_squares(brd).include?(5)
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  square = check_5_empty(brd, square) unless !!square
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose Square (#{joinor(empty_squares(brd), ', ', 'or')})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice")
  end
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def display_message(msg)
  msg.each { |message| prompt message.to_s } if msg.is_a?Array
  prompt msg if msg.is_a?String
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if line.all? { |square| brd[square] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |square| brd[square] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

# Bonus Features

# assigns connective word if needed to string
def joinor(empty_squares, connective_1 = ', ', connective_2 = 'or')
  choices = empty_squares.join(connective_1)
  choices[-3] = " #{connective_2}" if choices.length > 2
  choices
end

def end_round(board, winner, score)
  message = []
  if !!winner
    score[winner] += 1
    message << "#{winner} won this round!"
  else
    message << "It's a tie!"
  end
  if score[winner].nil? || score[winner] < 5
    message << "Continue to next round? (y or n)"
  else
    end_game(winner, message)
  end
  display_board(board, score, message)
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def display_score(score)
  puts ""
  puts "___________________________"
  puts "|        Rounds Won       |"
  puts "+------------+------------+"
  puts "|   Player   |  Computer  |"
  puts "+------------+------------+"
  puts "|     #{score['Player']}      |      #{score['Computer']}     |"
  puts "---------------------------"
  puts " "
end

def end_game(winner, message)
  message << "#{winner} won 5 rounds first!"
  message << "Would you like to start a new game? (y,n)"
end

def alternate_player(current_player)
  current_player == "Computer" ? "Player" : "Computer"
end

def place_piece_change_player!(brd, current_player)
  if current_player == "Computer"
    computer_places_piece!(brd)
  else
    player_places_piece!(brd)
  end
  alternate_player(current_player)
end

def who_goes_first
  answer =''
  loop do
    prompt "Enter (1) If you want to go first!"
    prompt "Enter (2) if you want the Computer to go first!"
    answer = gets.chomp.to_i
    break if [1, 2].include?(answer)
    prompt "Please choose a valid option"
  end
  answer==1 ? "Player" : "Computer"
end

loop do
  board = initialize_board(score)
  case FIRST_TURN
  when "choose"
    current_player = who_goes_first
  when "Computer"
    current_player = "Computer"
  else
    current_player = player
  end

  loop do
    display_board(board, score)
    current_player = place_piece_change_player!(board, current_player)
    break if someone_won?(board) || board_full?(board)
  end

  end_round(board, detect_winner(board), score)

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic-tac-toe"
