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

    # puts "Definition: #{@current_card.show_def}"
    #     print "What is the matching Term? "
    #     input = gets.chomp
    #     puts "This is before the if block: #{input}"

    if @current_card.show_term == input
      puts "Correct!"
      puts ""
      self.set_current_card
      @guess_counter = 1
      # return 'Correct!'

    elsif @guess_counter < 3
      # puts "This is inside the elsif block: #{input}"
      puts "Wrong! Try again!"
      puts ""
      @guess_counter += 1
      #self.guess#('and')


    elsif @guess_counter < 4
      puts "Wrong! The correct answer is: #{@current_card.show_term}"
      puts ""
      self.set_current_card
      @guess_counter = 1


    end
  end

  def guess_counter
    @guess_counter
  end
end

