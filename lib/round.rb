
require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :turns, :deck
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
    return percent.round(1)
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
     return percent.round(1)
   end

   def start
     card_counter = 1
     cards_in_game = deck.count
     puts "Welcome! You're playing with #{deck.count} cards."
     puts "-" * 40
     while deck.count > 0
       puts "Question #{card_counter} of #{cards_in_game}:\n #{current_card.question}\n\n"
       answer = gets.chomp.upcase
       take_turn(answer).feedback
       puts "-" * 40
       card_counter += 1
     end
     puts " " * 15 + "GAME OVER"
     puts "-" * 40
     puts "You had #{number_correct} correct guesses out of #{cards_in_game}!"
     puts "For a TOTAL SCORE of #{percent_correct}%."


    unique_catag = []
    @turns.each do |turn|
      if unique_catag.include?(turn.card.category)
        #do nothing
      else
        puts "#{turn.card.category} - #{percent_in_category_correct(turn.card.category)}% correct."
        unique_catag << turn.card.category
      end
    end
   end
end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# cards = [card_1, card_2, card_3]
# deck = Deck.new(cards)
# round = Round.new(deck)
# binding.pry
