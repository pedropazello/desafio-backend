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
end
