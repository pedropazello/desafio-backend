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

  def best_available_spot
    return 4 if spot_free?(4)
    available_spots.map(&:to_i).each do |spot|
      if BoardSimulator.anyone_can_win_with_this_spot?(spots.dup, spot)
        return spot
      end
    end
    nil
  end

  def random_available_spot
    available_spots.sample.to_i
  end

  def game_over?
    player1_wins? || player2_wins?
  end

  def player1_wins?
    player_wins?(Player::MARK_1)
  end

  def player2_wins?
    player_wins?(Player::MARK_2)
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

  def player_wins?(player)
    lines.select do |line|
      line.uniq.count == 1 && line.uniq[0] == player
    end.count > 0
  end

  def available_spots
    spots.select { |spot| spot_free?(spot) }
  end

  def starter_spots
    ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def lines
    [
      [spots[0], spots[1], spots[2]],
      [spots[3], spots[4], spots[5]],
      [spots[6], spots[7], spots[8]],
      [spots[0], spots[3], spots[6]],
      [spots[1], spots[4], spots[7]],
      [spots[2], spots[5], spots[8]],
      [spots[0], spots[4], spots[8]],
      [spots[2], spots[4], spots[6]]
    ]
  end
end
