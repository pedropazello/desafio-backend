class Game
  def initialize
    @configuration = Configuration.new
    @board = Board.new
  end

  def start_game
    until @board.game_over? || @board.tie?
      @configuration.player1.make_move(@board)
      if !@board.game_over? && !@board.tie?
        @configuration.player2.make_move(@board)
      end
    end
  end
end

game = Game.new
game.start_game
