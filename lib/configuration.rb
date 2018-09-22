class Configuration
  HUMAN_VS_COMPUTER    = "1"
  HUMAN_VS_HUMAN       = "2"
  COMPUTER_VS_COMPUTER = "3"

  attr_reader :difficulty, :game_mode

  def initialize
    @game_mode = Prompt::MainMenu.option
    if human_vs_computer? || computer_vs_computer?
      @difficulty = Prompt::Difficulty.option
    end
  end

  def player1
    controller = {
      HUMAN_VS_COMPUTER    => Controller::Human.new,
      HUMAN_VS_HUMAN       => Controller::Human.new,
      COMPUTER_VS_COMPUTER => Controller::Computer.new(
        difficulty: difficulty
      )
    }[game_mode]

    Player.new(type: 1, controller: controller)
  end

  def player2
    controller = {
      HUMAN_VS_COMPUTER    => Controller::Computer.new(
        difficulty: difficulty
      ),
      HUMAN_VS_HUMAN       => Controller::Human.new,
      COMPUTER_VS_COMPUTER => Controller::Computer.new(
        difficulty: difficulty
      )
    }[game_mode]

    Player.new(type: 2, controller: controller)
  end

  private

  def human_vs_computer?
    game_mode == HUMAN_VS_COMPUTER
  end

  def computer_vs_computer?
    game_mode == COMPUTER_VS_COMPUTER
  end
end
