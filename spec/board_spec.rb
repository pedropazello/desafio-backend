require 'spec_helper'

RSpec.describe Board do
  describe "#player1_insert" do
    let(:board) { Board.new }

    context "when spot is valid" do
      it "insert player1 mark on specific spot" do
        board.player1_insert(0)
        expect(board.board[0]).to eq("O")
      end
    end

    context "when spot is already used" do
      it "raise exception" do
        board.player1_insert(1)
        expect {
          board.player1_insert(1)
        }.to raise_exception(SpotAlreadyUsedError)
      end
    end

    context "when spot is a string" do
      it "raise exception" do
        expect {
          board.player1_insert("foo")
        }.to raise_exception(SpotDoesNotExistsError)
      end
    end

    context "when spot is not between 0 and 8" do
      it "raise exception" do
        expect {
          board.player1_insert(50)
        }.to raise_exception(SpotDoesNotExistsError)
      end
    end
  end

  describe "#player2_insert" do
    let(:board) { Board.new }

    context "when spot is valid" do
      it "insert player2 mark on specific spot" do
        board.player2_insert(6)
        expect(board.board[6]).to eq("X")
      end
    end

    context "when spot is already used" do
      it "raise exception" do
        board.player2_insert(2)
        expect {
          board.player2_insert(2)
        }.to raise_exception(SpotAlreadyUsedError)
      end
    end

    context "when spot is a string" do
      it "raise exception" do
        expect {
          board.player2_insert("bar")
        }.to raise_exception(SpotDoesNotExistsError)
      end
    end

    context "when spot is not between 0 and 8" do
      it "raise exception" do
        expect {
          board.player2_insert(50)
        }.to raise_exception(SpotDoesNotExistsError)
      end
    end
  end

  describe "#draw" do
    let(:board) { Board.new }

    it "draw the board with player1 mark" do
      board.player1_insert(0)
      expect(board.draw).to eq(
        " O | 1 | 2 \n" +
        "===+===+===\n" +
        " 3 | 4 | 5 \n" +
        "===+===+===\n" +
        " 6 | 7 | 8 \n"
      )
      board.player1_insert(2)
      expect(board.draw).to eq(
        " O | 1 | O \n" +
        "===+===+===\n" +
        " 3 | 4 | 5 \n" +
        "===+===+===\n" +
        " 6 | 7 | 8 \n"
      )
      board.player1_insert(4)
      expect(board.draw).to eq(
        " O | 1 | O \n" +
        "===+===+===\n" +
        " 3 | O | 5 \n" +
        "===+===+===\n" +
        " 6 | 7 | 8 \n"
      )
    end

    it "draw the board with player2 mark" do
      board.player2_insert(0)
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
        board.player1_insert(0)
        board.player1_insert(1)
        board.player1_insert(2)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when second line is filled with same mark" do
      it "returns true" do
        board.player1_insert(3)
        board.player1_insert(4)
        board.player1_insert(5)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when third line is filled with same mark" do
      it "returns true" do
        board.player1_insert(6)
        board.player1_insert(7)
        board.player1_insert(8)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when first column is filled with same mark" do
      it "returns true" do
        board.player1_insert(0)
        board.player1_insert(3)
        board.player1_insert(6)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when second column is filled with same mark" do
      it "returns true" do
        board.player1_insert(1)
        board.player1_insert(4)
        board.player1_insert(7)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when third column is filled with same mark" do
      it "returns true" do
        board.player1_insert(2)
        board.player1_insert(5)
        board.player1_insert(8)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when first line of first column, second line of second column and third line of third column is filled with same mark" do
      it "returns true" do
        board.player1_insert(0)
        board.player1_insert(4)
        board.player1_insert(8)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when third column first line, second column second line and first column third line is filled with same line" do
      it "returns true" do
        board.player1_insert(2)
        board.player1_insert(4)
        board.player1_insert(6)
        expect(board.game_over?).to be_truthy
      end
    end

    context "when any line is not filled" do
      it "returns false" do
        board.player1_insert(0)
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
        board.player1_insert(0)
        board.player2_insert(1)
        board.player1_insert(2)
        board.player2_insert(3)
        board.player1_insert(4)
        board.player2_insert(5)
        board.player1_insert(6)
        board.player2_insert(7)
        board.player1_insert(8)

        expect(board.tie?).to be_truthy
      end
    end
  end
end
