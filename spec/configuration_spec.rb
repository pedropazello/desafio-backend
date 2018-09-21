require 'spec_helper'

RSpec.describe Configuration do
  describe "#configure_game" do
    let(:configuration) { Configuration.new }

    context "when option 1 is choosed" do
      before do
        allow(Prompt::MainMenu).to receive(:option) { "1" }
      end

      it "configure player 1 as Human" do
        expect(configuration.player1).to be_a(Player)
        expect(configuration.player1.controller).to be_a(Human)
      end

      it "configure player 2 as Computer" do
        expect(configuration.player2).to be_a(Player)
        expect(configuration.player2.controller).to be_a(Computer)
      end
    end

    context "when option 2 is choosed" do
      before do
        allow(Prompt::MainMenu).to receive(:option) { "2" }
      end

      it "configure player 1 as Human" do
        expect(configuration.player1).to be_a(Player)
        expect(configuration.player1.controller).to be_a(Human)
      end

      it "configure player 2 as Human" do
        expect(configuration.player2).to be_a(Player)
        expect(configuration.player2.controller).to be_a(Human)
      end
    end

    context "when option 3 is choosed" do
      before do
        allow(Prompt::MainMenu).to receive(:option) { "3" }
      end

      it "configure player 1 as Human" do
        expect(configuration.player1).to be_a(Player)
        expect(configuration.player1.controller).to be_a(Computer)
      end

      it "configure player 2 as Human" do
        expect(configuration.player2).to be_a(Player)
        expect(configuration.player2.controller).to be_a(Computer)
      end
    end
  end
end
