class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @answer = answer.upcase
    @question = question
    @category = category.chomp
  end
end
