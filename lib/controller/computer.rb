module Controller
  class Computer
    EASY   = "1"
    NORMAL = "2"
    HARD   = "3"

    EASY_HIT_PERCENT   = 30.0
    NORMAL_HIT_PERCENT = 60.0
    HARD_HIT_PERCENT   = 100.0

    attr_reader :difficulty

    def initialize(difficulty: HARD)
      @difficulty = difficulty
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
      best_spot = board.best_available_spot
      return best_spot if best_spot && do_right_move?
      board.random_available_spot
    end

    private

    def do_right_move?
      rand.to_f <= (hit_percent / 100.0)
    end

    def hit_percent
      return EASY_HIT_PERCENT if easy?
      return NORMAL_HIT_PERCENT if normal?
      return HARD_HIT_PERCENT if hard?
    end
  end
end
