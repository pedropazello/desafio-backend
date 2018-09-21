module Prompt
  class MainMenu
    def self.option
      show
      get_option
    end

    private

    def self.show
      puts "Tic Tac Toe"
      puts "Press:"
      puts "1 - Player vs Computer"
      puts "2 - Player vs Player"
      puts "3 - Computer vs Computer"
    end

    def self.get_option
      option = gets.chomp
      return option if valid_option?(option)
      puts "Invalid option. Choose the option 1, 2 or 3."
      self.get_option
    end

    def self.valid_option?(option)
      /^[1-3]$/.match(option)
    end
  end
end
