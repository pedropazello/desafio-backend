require 'spec_helper'

RSpec.describe Board do
  describe "#draw" do
    let(:board) { Board.new }

    it "draw the board with player1 mark" do
      board.insert(0, Player::MARK_1)
      expect(board.draw).to eq(
        " O | 1 | 2 \n" +
        "===+===+===\n" +
        " 3 | 4 | 5 \n" +
        "===+===+===\n" +
        " 6 | 7 | 8 \n"
      )
      board.insert(2, Player::MARK_1)
      expect(board.draw).to eq(
        " O | 1 | O \n" +
        "===+===+===\n" +
        " 3 | 4 | 5 \n" +
        "===+===+===\n" +
        " 6 | 7 | 8 \n"
      )
      board.insert(4, Player::MARK_1)
      expect(board.draw).to eq(
        " O | 1 | O \n" +
        "===+===+===\n" +
        " 3 | O | 5 \n" +
        "===+===+===\n" +
        " 6 | 7 | 8 \n"
      )
    end

    it "draw the board with player2 mark" do
      board.insert(0, Player::MARK_2)
      expect(board.draw).to eq(
        " X | 1 | 2 \n" +
        "===+===+===\n" +
        " 3 | 4 | 5 \n" +
        "===+===+===\n" +
        " 6 | 7 | 8 \n"
      )
    end
  end

  describe "#game_over?" do
    let(:board) { Board.new }

    context "when first line is filled with same mark" do
      it "returns true" do
        board.insert(0, Player::MARK_2)
        board.insert(1, Player::MARK_2)
        board.insert(2, Player::MARK_2)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when second line is filled with same mark" do
      it "returns true" do
        board.insert(3, Player::MARK_1)
        board.insert(4, Player::MARK_1)
        board.insert(5, Player::MARK_1)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when third line is filled with same mark" do
      it "returns true" do
        board.insert(6, Player::MARK_1)
        board.insert(7, Player::MARK_1)
        board.insert(8, Player::MARK_1)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when first column is filled with same mark" do
      it "returns true" do
        board.insert(0, Player::MARK_1)
        board.insert(3, Player::MARK_1)
        board.insert(6, Player::MARK_1)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when second column is filled with same mark" do
      it "returns true" do
        board.insert(1, Player::MARK_1)
        board.insert(4, Player::MARK_1)
        board.insert(7, Player::MARK_1)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when third column is filled with same mark" do
      it "returns true" do
        board.insert(2, Player::MARK_1)
        board.insert(5, Player::MARK_1)
        board.insert(8, Player::MARK_1)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when first line of first column, second line of second column and third line of third column is filled with same mark" do
      it "returns true" do
        board.insert(0, Player::MARK_1)
        board.insert(4, Player::MARK_1)
        board.insert(8, Player::MARK_1)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when third column first line, second column second line and first column third line is filled with same line" do
      it "returns true" do
        board.insert(2, Player::MARK_1)
        board.insert(4, Player::MARK_1)
        board.insert(6, Player::MARK_1)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when any line is not filled" do
      it "returns false" do
        board.insert(0, Player::MARK_1)
        expect(board.game_over?).to be_falsey
      end
    end

    context "when board is empty" do
      it "returns false" do
        expect(board.game_over?).to be_falsey
      end
    end
  end

  describe "#tie?" do
    let(:board) { Board.new }

    context "when board is empty" do
      it "returns false" do
        expect(board.tie?).to be_falsey
      end
    end

    context "when game is over" do
      it "returns false" do
        allow(board).to receive(:game_over?) { true }
        expect(board.tie?).to be_falsey
      end
    end

    context "when board is completely filled" do
      it "returns true" do
        board.insert(0, Player::MARK_1)
        board.insert(1, Player::MARK_2)
        board.insert(2, Player::MARK_1)
        board.insert(3, Player::MARK_2)
        board.insert(4, Player::MARK_1)
        board.insert(5, Player::MARK_2)
        board.insert(6, Player::MARK_1)
        board.insert(7, Player::MARK_2)
        board.insert(8, Player::MARK_1)

        expect(board.tie?).to be_truthy
      end
    end
  end
end
