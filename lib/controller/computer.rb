module Controller
  class Computer
    EASY   = "1"
    NORMAL = "2"
    HARD   = "3"

    attr_reader :difficulty, :player_type

    def initialize(difficulty: HARD, player_type: 2)
      @difficulty = difficulty
      @player_type = player_type
    end

    def easy?
      difficulty == EASY
    end

    def normal?
      difficulty == NORMAL
    end

    def hard?
      difficulty == HARD
    end

    def get_spot(board)
      eval_board(board)
    end

    def eval_board(board)
      spot = nil
      until spot
        next spot = 4 if board.spot_free?(4)
        spot = get_best_move(board)
      end
      spot
    end

    def get_best_move(board)
      available_spaces = []
      best_move = nil
      board.board.each do |s|
        if s != "X" && s != "O"
          available_spaces << s
        end
      end
      available_spaces.each do |as|
        board.board[as.to_i] = Player::MARK_2
        if board.game_over?
          best_move = as.to_i
          board.board[as.to_i] = as
          return best_move
        else
          board.board[as.to_i] = Player::MARK_1
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
end
