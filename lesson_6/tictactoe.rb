require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

# computer_score = 0
# player_score = 0

def prompt(msg)
  puts "=>#{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'

  prompt "You're an X. Computer is O."

  puts ""
  (1..3).each do |num|
    puts "     |     |"
    puts "  #{brd[(num * 3) - 2]}  |  #{brd[(num * 3) - 1]}  |  #{brd[num * 3]}"
    puts "     |     |"
    puts "-----+-----+------" unless num == 3
  end
=begin
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
=end
  puts ""
end

# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
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
def joinor(empty_squares, connective_1=', ', connective_2='or')
  choices = empty_squares.join(connective_1)
  choices[-3] = " #{connective_2}" if choices.length > 2
  choices
end

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_places_piece!(board)

    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic-tac-toe"
