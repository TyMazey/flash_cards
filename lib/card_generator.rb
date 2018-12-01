require './lib/card'

class CardGenerator
  def initialize(file_name)
    @file_name = file_name
  end

def cards
  new_deck = []
  card_file = File.open(@file_name)
    card_file.each_line do |line|
      new_array = line.split(",")
      new_card = Card.new(new_array[0], new_array[1], new_array[2])
      new_deck << new_card
    end
  return new_deck
  card_file.close
  end
end
