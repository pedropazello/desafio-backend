require 'spec_helper'

RSpec.describe Controller::Computer do
  describe "#get_spot" do
    context "when difficulty is hard and computer is player 2" do
      let(:computer) do
        Controller::Computer.new(
          difficulty: Controller::Computer::HARD
        )
      end

      context "when spot 4 is empty on board" do
        let(:board) { Board.new }

        it "returns 4" do
          expect(computer.get_spot(board)).to eq(4)
        end
      end

      context "and spot 4 is filled on board" do
        let(:board) { Board.new }

        before do
          board.insert(4, Player::MARK_1)
        end

        context "and computer can win on next move" do
          before do
            board.insert(0, Player::MARK_2)
            board.insert(1, Player::MARK_2)
          end

          it "returns 2" do
            expect(computer.get_spot(board)).to eq(2)
          end
        end

        context "and next player can win on next move" do
          before do
            board.insert(0, Player::MARK_1)
            board.insert(1, Player::MARK_1)
          end

          it "returns 2" do
            expect(computer.get_spot(board)).to eq(2)
          end
        end

        context "and no one player can win on next move" do
          before do
            allow(board).to receive(:random_available_spot) { 5 }
          end

          it "returns a random spot available" do
            expect(computer.get_spot(board)).to eq(5)
          end
        end
      end
    end
  end
end
