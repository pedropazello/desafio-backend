class Configuration
  def configure_game
    puts "Tic Tac Toe"
    puts "Press:"
    puts "1 - Player vs Computer"
    puts "2 - Player vs Player"
    puts "3 - Computer vs Computer"
    until @option do
      option = gets.chomp
      next @option = option if valid_option?(option)
      puts "Invalid option. Choose the option 1, 2 or 3."
    end
  end

  def player1
    {
      "1" => Player.new(type: 1, controller: Human.new),
      "2" => Player.new(type: 1, controller: Human.new),
      "3" => Player.new(type: 1, controller: Computer.new)
    }[@option]
  end

  def player2
    {
      "1" => Player.new(type: 2, controller: Computer.new),
      "2" => Player.new(type: 2, controller: Human.new),
      "3" => Player.new(type: 2, controller: Computer.new)
    }[@option]
  end

  private

  def valid_option?(option)
    /^[1-3]$/.match(option)
  end
end
