class Configuration
  def initialize
    @option = Prompt::MainMenu.option
  end

  def player1
    controller = {
      "1" => Human.new,
      "2" => Human.new,
      "3" => Computer.new
    }[@option]

    Player.new(type: 1, controller: controller)
  end

  def player2
    controller = {
      "1" => Computer.new,
      "2" => Human.new,
      "3" => Computer.new
    }[@option]

    Player.new(type: 2, controller: controller)
  end
end
