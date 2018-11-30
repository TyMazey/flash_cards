require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card= card
  end

  def correct?
    card.answer == guess
  end

  def feedback
    if card.answer == guess
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end
