require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class GeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_instance_of CardGenerator, cards
  end

  def test_makes_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
  end
end
