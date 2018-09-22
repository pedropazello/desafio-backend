require 'spec_helper'

RSpec.describe Configuration do
  describe "#initialize" do
    let(:configuration) { Configuration.new }

    context "when option 1 is choosed" do
      before do
        allow(Prompt::MainMenu).to receive(:option) { "1" }
        allow(Prompt::Difficulty).to receive(:option) { "1" }
      end

      it "configure player 1 as Human" do
        expect(configuration.player1).to be_a(Player)
        expect(configuration.player1.controller).to be_a(Controller::Human)
      end

      it "configure player 2 as Computer" do
        expect(configuration.player2).to be_a(Player)
        expect(configuration.player2.controller).to be_a(Controller::Computer)
        expect(configuration.player2.controller.easy?).to be_truthy
      end
    end

    context "when option 2 is choosed" do
      before do
        allow(Prompt::MainMenu).to receive(:option) { "2" }
      end

      it "configure player 1 as Human" do
        expect(configuration.player1).to be_a(Player)
        expect(configuration.player1.controller).to be_a(Controller::Human)
      end

      it "configure player 2 as Human" do
        expect(configuration.player2).to be_a(Player)
        expect(configuration.player2.controller).to be_a(Controller::Human)
      end
    end

    context "when option 3 is choosed" do
      before do
        allow(Prompt::MainMenu).to receive(:option) { "3" }
        allow(Prompt::Difficulty).to receive(:option) { "3" }
      end

      it "configure player 1 as Human" do
        expect(configuration.player1).to be_a(Player)
        expect(configuration.player1.controller).to be_a(Controller::Computer)
        expect(configuration.player1.controller.hard?).to be_truthy
      end

      it "configure player 2 as Human" do
        expect(configuration.player2).to be_a(Player)
        expect(configuration.player2.controller).to be_a(Controller::Computer)
        expect(configuration.player2.controller.hard?).to be_truthy
      end
    end
  end
end
