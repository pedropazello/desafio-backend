class BoardSimulator
  def self.anyone_can_win_with_this_spot?(spots, spot)
    can_win_with_this_spot?(spots, spot, Player::MARK_1) ||
      can_win_with_this_spot?(spots, spot, Player::MARK_2)
  end

  private

  def self.can_win_with_this_spot?(spots, spot, player)
    fake_board = Board.new(spots: spots)
    fake_board.insert(spot, player)
    return true if fake_board.game_over?
    false
  end
end
