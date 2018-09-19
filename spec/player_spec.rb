require 'spec_helper'

RSpec.describe Player do
  describe "#make_move" do
    context "when is a player 1" do
      let(:board) { Board.new }
      let(:computer) { Computer.new }
      let(:player) { Player.new(type: 1, controller: computer) }

      it "insert O on specific spot of the board" do
        allow(computer).to receive(:get_spot).with(board) { 0 }
        player.make_move(board)
        expect(board.draw).to eq(
          " O | 1 | 2 \n" +
          "===+===+===\n" +
          " 3 | 4 | 5 \n" +
          "===+===+===\n" +
          " 6 | 7 | 8 \n"
        )
      end
    end

    context "when is a player 2" do
      let(:board) { Board.new }
      let(:computer) { Computer.new }
      let(:player) { Player.new(type: 2, controller: computer) }

      it "insert X on specific sot of the board" do
        allow(computer).to receive(:get_spot).with(board) { 4 }
        player.make_move(board)
        expect(board.draw).to eq(
          " 0 | 1 | 2 \n" +
          "===+===+===\n" +
          " 3 | X | 5 \n" +
          "===+===+===\n" +
          " 6 | 7 | 8 \n"
        )
      end
    end
  end
end
