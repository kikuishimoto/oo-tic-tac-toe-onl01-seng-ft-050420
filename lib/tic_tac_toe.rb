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
    WIN_COMBINATIONS.each {|win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]

      position_1 = @board[index_0]
      position_2 = @board[index_1]
      position_3 = @board[index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    }
    return false
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
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
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
