module Controller
  class Human
    def get_spot(board)
      puts board.draw
      Prompt::HumanMove.option(board)
    end
  end
end
