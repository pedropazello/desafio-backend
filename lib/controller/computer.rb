module Controller
  class Computer
    EASY   = "1"
    NORMAL = "2"
    HARD   = "3"

    EASY_HIT_PERCENT   = 30.0
    NORMAL_HIT_PERCENT = 60.0
    HARD_HIT_PERCENT   = 100.0

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
        spot = get_move(board)
      end
      spot
    end

    def get_move(board)
      if do_right_move?
        return 4 if board.spot_free?(4)
        board.available_spots.map(&:to_i).each do |spot|
          if BoardSimulator.anyone_can_win_with_this_spot?(board.spots.dup, spot)
            return spot
          end
        end
      end

      random_spot(board)
    end

    def do_right_move?
      rand.to_f <= (hit_percent / 100.0)
    end

    def random_spot(board)
      n = rand(0..board.available_spots.count)
      board.available_spots[n].to_i
    end

    def hit_percent
      return EASY_HIT_PERCENT if easy?
      return NORMAL_HIT_PERCENT if normal?
      return HARD_HIT_PERCENT if hard?
    end
  end
end
