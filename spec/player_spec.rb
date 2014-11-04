require 'spec_helper'

describe BlackJack::Player do
  let(:player) {BlackJack::Player.new }

  describe 'on initialization' do
    it "player hand size should be 2" do

      expect(player.hand.length).to be == 2
    end
  end


end
