class Player
  MARK_1 = "O"
  MARK_2 = "X"

  attr_reader :type, :controller

  def initialize(type:, controller:)
    @type = type
    @controller = controller
  end

  def make_move(board)
    spot = @controller.get_spot(board)
    board.insert(spot, mark)
  end

  private

  def mark
    return MARK_1 if @type == 1
    return MARK_2 if @type == 2
  end
end
