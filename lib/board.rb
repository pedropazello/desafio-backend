class Board
  attr_reader :board

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def insert(spot, mark)
    @board[spot] = mark
  end

  def draw
    " #{board[0]} | #{board[1]} | #{board[2]} \n" +
    "===+===+===\n" +
    " #{board[3]} | #{board[4]} | #{board[5]} \n" +
    "===+===+===\n" +
    " #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def game_over?
    b = board
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie?
    board.all? do |spot|
      spot == Player::MARK_1 || spot == Player::MARK_2
    end
  end

  def spot_free?(spot)
    board[spot.to_i] != Player::MARK_1 &&
      board[spot.to_i] != Player::MARK_2
  end
end
