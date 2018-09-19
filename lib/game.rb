class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def start_game
    # start by printing the board
    puts board.draw
    puts "Enter [0-8]:"
    # loop through until the game was won or tied
    until board.game_over? || board.tie?
      @human.play(@board)
      if !board.game_over? && !board.tie?
        @computer.play(@board)
      end
      puts board.draw
    end
    puts "Game over"
  end
end

game = Game.new
game.start_game
