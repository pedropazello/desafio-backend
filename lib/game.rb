class Game
  def initialize
    @configuration = Configuration.new
    @configuration.configure_game
    @board = Board.new
  end

  def start_game
    puts @board.draw
    puts "Enter [0-8]:"
    until @board.game_over? || @board.tie?
      player1.make_move(@board)
      if !@board.game_over? && !@board.tie?
        player2.make_move(@board)
      end
      puts @board.draw
    end
    puts "Game over"
  end

  private

  def player1
    @configuration.player1
  end

  def player2
    @configuration.player2
  end

  def show_board
    @board.draw
  end
end

game = Game.new
game.start_game
