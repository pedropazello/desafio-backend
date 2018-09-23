class Game
  attr_reader :configuration, :board
  def initialize
    @configuration = Configuration.new
    @board = Board.new
  end

  def start_game
    run_rounds
    show_end_status
  end

  private

  def run_rounds
    return if game_over?
    configuration.player1.make_move(board)
    configuration.player2.make_move(board) if !game_over?
    run_rounds
  end

  def game_over?
    board.game_over? || board.tie?
  end

  def show_end_status
    return show_winner if board.game_over?
    show_tie_message if board.tie?
  end

  def show_winner
    puts "Game Over. Winner: #{winner}"
  end

  def show_tie_message
    puts "Game Draw :("
  end

  def winner
    if board.player1_wins?
      "Player 1"
    else
      "Player 2"
    end
  end
end

game = Game.new
game.start_game
