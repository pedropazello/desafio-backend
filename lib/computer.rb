class Computer
  def play(board)
    eval_board(board)
  end

  def eval_board(board)
    spot = nil
    until spot
      if board.board[4] == "4"
        spot = 4
        board.player2_insert(4)
      else
        spot = get_best_move(board, Board::PLAYER2_MARK)
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
      if board.game_over?
        best_move = as.to_i
        board.board[as.to_i] = as
        return best_move
      else
        board.board[as.to_i] = Board::PLAYER1_MARK
        if board.game_over?
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
end
