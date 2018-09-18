class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def start_game
    # start by printing the board
    puts board.draw
    puts "Enter [0-8]:"
    # loop through until the game was won or tied
    until game_is_over(@board) || tie(@board)
      get_human_spot
      if !game_is_over(@board) && !tie(@board)
        eval_board
      end
      puts board.draw
    end
    puts "Game over"
  end

  def get_human_spot
    spot = nil
    until spot
      spot = gets.chomp
      begin
        board.player1_insert(spot)
      rescue SpotAlreadyUsedError
        puts "Spot #{spot} is already used, try another"
        spot = nil
      rescue SpotDoesNotExistsError
        puts "Spot #{spot} does not exists, try another"
        spot = nil
      end
    end
  end

  def eval_board
    spot = nil
    until spot
      if board.board[4] == "4"
        spot = 4
        board.player2_insert(4)
      else
        spot = get_best_move(@board, Board::PLAYER2_MARK)
        if board.board[spot] != "X" && board.board[spot] != "O"
          board.player2_insert(spot)
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board.board[as.to_i] = Board::PLAYER2_MARK
      if game_is_over(board)
        best_move = as.to_i
        board.board[as.to_i] = as
        return best_move
      else
        board.board[as.to_i] = Board::PLAYER1_MARK
        if game_is_over(board)
          best_move = as.to_i
          board.board[as.to_i] = as
          return best_move
        else
          board.board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def game_is_over(b)
    b = b.board
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.board.all? { |s| s == "X" || s == "O" }
  end
end

game = Game.new
game.start_game
