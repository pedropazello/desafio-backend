class Game
  def initialize
    @board = Board.new
    @player1 = Player.new(type: 1, controller: Human.new)
    @player2 = Player.new(type: 2, controller: Computer.new)
  end

  def start_game
    puts @board.draw
    puts "Enter [0-8]:"
    until @board.game_over? || @board.tie?
      @player1.make_move(@board)
      if !@board.game_over? && !@board.tie?
        @player2.make_move(@board)
      end
      puts @board.draw
    end
    puts "Game over"
  end
end

game = Game.new
game.start_game
