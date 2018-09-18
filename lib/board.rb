class Board
  PLAYER1_MARK = "O"
  PLAYER2_MARK = "X"

  attr_reader :board

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def player1_insert(spot)
    insert(spot, PLAYER1_MARK)
  end

  def player2_insert(spot)
    insert(spot, PLAYER2_MARK)
  end

  def draw
    " #{board[0]} | #{board[1]} | #{board[2]} \n" +
    "===+===+===\n" +
    " #{board[3]} | #{board[4]} | #{board[5]} \n" +
    "===+===+===\n" +
    " #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  private

  def insert(spot, player)
    raise SpotDoesNotExistsError unless valid_spot?(spot)
    raise SpotAlreadyUsedError unless spot_free?(spot.to_i)
    @board[spot.to_i] = player
  end

  def spot_free?(spot)
    @board[spot] != PLAYER1_MARK &&
      @board[spot] != PLAYER2_MARK
  end

  def valid_spot?(spot)
    /^[0-8]{1}$/.match(spot.to_s)
  end
end
