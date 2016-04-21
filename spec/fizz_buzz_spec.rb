require 'spec_helper'

describe FizzBuzz do
  context 'check rules' do
    before do
      allow(GameTime).to receive(:today).and_return(4)
      @game = FizzBuzz.new
    end

    it 'Gives 1 get 1' do
      expect(@game.play(1)).to eq 1
    end

    it 'Gives 2 get 2' do
      expect(@game.play(2)).to eq 2
    end

    it 'Gives 3 get Fizz' do
      expect(@game.play(3)).to eq 'Fizz'
    end

    it 'Gives 6 get Fizz' do
      expect(@game.play(6)).to eq 'Fizz'
    end

    it 'Gives 5 get Buzz' do
      expect(@game.play(5)).to eq 'Buzz'
    end

    it 'Gives 15 get FizzBuzz' do
      expect(@game.play(15)).to eq 'FizzBuzz'
    end

    it 'Gives 7 get Buzz' do
      expect(@game.play(7)).to eq 'Pum'
    end

    it 'Gives 21 get FizzPum' do
      expect(@game.play(21)).to eq 'FizzPum'
    end

    it 'Gives 105 get FizzBuzzPum' do
      expect(@game.play(105)).to eq 'FizzBuzzPum'
    end

    it 'Gives 23 get Banana' do
      expect(@game.play(23)).to eq 'Banana'
    end

    it 'Give 52 get NIKE' do
      expect(@game.play(52)).to eq 'Nike'
    end

    it "Give 1 on Friday get 1Domino's" do
      allow(GameTime).to receive(:today).and_return(5)
      expect(@game.play(1)).to eq "1Domino's"
    end

  end
end