require './card.rb'

class Deck
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
    @current_card.show_def


    if @current_card.show_term == input
      puts "Correct!"
      self.set_current_card
      @guess_counter = 1
      return 'Correct!'

    elsif @guess_counter < 3
      puts "Wrong! Try again!"
      @guess_counter += 1
      self.guess('and')
    else
      puts "Wrong! #{@current_card.show_term}"
      self.set_current_card
      @guess_counter = 1
      return 'Wrong!'

    end
  end


end