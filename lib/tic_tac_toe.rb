class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #bottom row
    [6,7,8],#last row
    [0,3,6], #left row
    [1,4,7], #middle row
    [2,5,8], #right row
    [0,4,8], #diagnol
    [2,4,6] #diagnol
  ]
  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(string)
    @index = string.to_i - 1
  end
  def move(index, token= 'X')
    @board[index] = token
  end
  def position_taken?(index)
    if @board[index] == ' '
      false
    else
      true
    end
  end
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      nil
    end
  end
  def turn
    puts "Choose a number between 1-9 to place your piece!"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index) == true
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end
  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end
  def current_player
    if turn_count % 2 == 0
      'X'
    else
      'O'
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
        false
    end
  end
  def full?
    @board.all?{|occupied| occupied != ' '}
  end
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  def over?
    if won? or draw?
      true
    end
  end
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"

      end
    end
  end
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
