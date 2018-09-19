class Human
  def play(board)
    spot = nil
    until spot
      spot = gets.chomp
      begin
        board.player1_insert(spot)
      rescue SpotAlreadyUsedError
        puts "Spot #{spot} is already used, try another"
        spot = nil
      rescue SpotDoesNotExistsError
        puts "Spot #{spot} does not exists, try another"
        spot = nil
      end
    end
  end
end
