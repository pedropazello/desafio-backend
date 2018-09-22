module Prompt
  class Difficulty
    def self.option
      puts "Choose the game difficulty"
      puts "1 - Easy"
      puts "2 - Normal"
      puts "3 - Hard"
      self.get_option
    end

    private

    def self.get_option
      option = gets.chomp
      return option if self.valid_option?(option)
      puts "option #{option} is invalid. Try another."
      self.get_option
    end

    def self.valid_option?(option)
      /^[1-3]$/.match(option)
    end
  end
end
