module Controller
  class Human
    def get_spot(board)
      Prompt::HumanMove.option(board)
    end
  end
end
