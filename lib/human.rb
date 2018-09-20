class Human
  def get_spot(board)
    spot = gets.chomp
    return spot.to_i if valid_spot?(spot) && board.spot_free?(spot)
    puts "spot #{spot} is invalid. Try another."
    self.get_spot(board)
  end

  private

  def valid_spot?(spot)
    /^[0-8]{1}$/.match(spot.to_s)
  end
end
