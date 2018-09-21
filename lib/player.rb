class Player
  MARK_1 = "O"
  MARK_2 = "X"

  attr_reader :type, :controller

  def initialize(type:, controller:)
    @type = type
    @controller = controller
  end

  def make_move(board)
    puts_round_header
    puts board.draw if controller.is_a?(Human)
    spot = @controller.get_spot(board)
    board.insert(spot, mark)
    puts board.draw if controller.is_a?(Computer)
  end

  private

  def puts_round_header
    puts "=============="
    puts "Player #{type}"
  end

  def mark
    return MARK_1 if @type == 1
    return MARK_2 if @type == 2
  end
end
