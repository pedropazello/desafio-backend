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

    private

    def eval_board(board)
      spot = nil
      until spot
        next spot = 4 if board.spot_free?(4)
        spot = get_best_move(board)
      end
      spot
    end

    def get_best_move(board)
      board.available_spots.map(&:to_i).each do |spot|
        if BoardSimulator.anyone_can_win_with_this_spot?(board.spots.dup, spot)
          return spot
        end
      end

      n = rand(0..board.available_spots.count)
      return board.available_spots[n].to_i
    end
  end
end
