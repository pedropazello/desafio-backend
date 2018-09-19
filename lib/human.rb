class Human
  def get_spot(board)
    spot = nil
    until spot
      spot = gets.chomp
    end
    spot.to_i
  end
end
