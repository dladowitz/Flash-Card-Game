require './deck.rb'
require './card.rb'
require './maker.rb'



class Session

  def initialize
    @deck = Deck.new('dictionary.txt')
    @deck.set_current_card
  end

  def play
      puts "\033[35mFlashcard Game Module: \033[0m"
      puts "Type \033[32m-exit\033[0m at any time to return to the main menu."
      puts ""
      puts "\033[33mDefinition\033[0m: #{@deck.current_card.definition}"
      print "What is the matching \033[33mTerm\033[0m? "
      input = gets.chomp

      if input == '-exit'
        puts "Thanks for playing. Come back when you are smarter!"
        $command = '-pre-exit'

      else
        @deck.guess(input)
      end
  end

  def create
    puts "\033[35mFlashcard Maker Module: \033[0m"
    puts "Type \033[32m-exit\033[0m at any time to return to the main menu."
    puts ""
    print "\033[33mType in a Term: \033[0m"
    new_term = gets.chomp
    if new_term == '-exit'
      $command = '-pre-exit'
    else
      print "\033[33mType in the matching definition?\033[0m "
      new_definition = gets.chomp
      puts ""
      if new_definition == '-exit'
        puts "Thanks for making some cards. Come back anytime!"
        $command = '-exit'
      else
          new_card = "#{new_term}\t#{new_definition}\n"
          maker = Maker.new
          maker.add_new_card(new_card)
      end
    end
  end


end
