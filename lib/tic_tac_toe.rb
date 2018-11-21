class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    ]
    
 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
   user_input.to_i - 1
  end
  
  def move(index, value="X")
  @board[index] = value
  end
  
  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if (position_taken?(index) == false && index.between?(0, 8))
      true
    else
      false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    gets.chomp 
    
   
    input_to_index(user_input)
    if valid_move?
      move(index, value="X")
    else !valid_move?
      puts "Please enter 1-9:"
      gets.chomp
    end
  end 

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
end