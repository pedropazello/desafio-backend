class Board
  def initialize(spots: nil)
    @spots = spots || starter_spots
  end

  def insert(spot, mark)
    @spots[spot] = mark
  end

  def draw
    " #{spots[0]} | #{spots[1]} | #{spots[2]} \n" +
    "===+===+===\n" +
    " #{spots[3]} | #{spots[4]} | #{spots[5]} \n" +
    "===+===+===\n" +
    " #{spots[6]} | #{spots[7]} | #{spots[8]} \n"
  end

  def available_spots
    spots.select do |spot|
      spot != Player::MARK_2 && spot != Player::MARK_1
    end
  end

  def game_over?
    [spots[0], spots[1], spots[2]].uniq.length == 1 ||
    [spots[3], spots[4], spots[5]].uniq.length == 1 ||
    [spots[6], spots[7], spots[8]].uniq.length == 1 ||
    [spots[0], spots[3], spots[6]].uniq.length == 1 ||
    [spots[1], spots[4], spots[7]].uniq.length == 1 ||
    [spots[2], spots[5], spots[8]].uniq.length == 1 ||
    [spots[0], spots[4], spots[8]].uniq.length == 1 ||
    [spots[2], spots[4], spots[6]].uniq.length == 1
  end

  def tie?
    spots.all? do |spot|
      spot == Player::MARK_1 || spot == Player::MARK_2
    end
  end

  def spot_free?(spot)
    spots[spot.to_i] != Player::MARK_1 &&
      spots[spot.to_i] != Player::MARK_2
  end

  def spots
    @spots.dup.freeze
  end

  private

  def starter_spots
    ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end
end
