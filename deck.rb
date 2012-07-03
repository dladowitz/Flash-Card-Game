require './card.rb'

class Deck
  attr_reader :current_card

  def initialize(dictionary_file)
    @file = File.readlines(dictionary_file)
    @card_counter = -1
    @guess_counter = 1
    @set_of_cards = []
    @file.each do |line|
      @set_of_cards << Card.new(line.split("\t")[0].strip, line.split("\t")[1].strip)
    end
  end

  def show_card_set
    @set_of_cards
  end

  def set_current_card
    @card_counter += 1
    @current_card = @set_of_cards[@card_counter]
  end

  def guess(input)
    if @current_card.term == input
      puts "\033[32mCorrect!\033[0m"
      puts
      self.set_current_card
      @guess_counter = 1


    elsif @guess_counter < 3

      puts "\033[31mWrong! Try again!\033[0m"
      puts
      @guess_counter += 1



    elsif @guess_counter < 4
      puts "\033[31mWrong! The correct answer is: \033[0m#{@current_card.term}"
      puts
      self.set_current_card
      @guess_counter = 1


    end
  end

  def guess_counter
    @guess_counter
  end
end

