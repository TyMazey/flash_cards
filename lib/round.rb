require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :turns #, :current_card
  def initialize(deck)
    @turns = []
    @deck = deck
    #@current_card = @deck.cards[0]
  end

  def current_card
   @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    return new_turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    return correct
  end

  def number_correct_by_category(category)
    correct = 0
    @turns.each do |turn|
      if turn.card.category == category
        if turn.correct?
           correct += 1
        end
      end
    end
    return correct
  end

  def percent_correct
    out_of = @turns.count
    correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    percent = (correct / out_of) * 100.0
    return percent.round(2)
  end

  def percent_in_category_correct(category)
    out_of = 0.0
    @turns.each do |turn|
      if turn.card.category == category
           out_of += 1
      end
    end
    correct = 0.0
    @turns.each do |turn|
      if turn.card.category == category
        if turn.correct?
           correct += 1
         end
       end
     end
     percent = (correct / out_of) * 100.0
     return percent.round(2)
   end

end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# cards = [card_1, card_2, card_3]
# deck = Deck.new(cards)
# round = Round.new(deck)
# binding.pry
