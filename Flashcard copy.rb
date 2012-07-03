require './deck.rb'
require './card.rb'
require './maker.rb'


@deck = Deck.new('dictionary.txt')
@deck.set_current_card

puts "Welcome to the Flash Card App\n"
puts "You can play a matching game or"
puts "create new flash cards"
puts ""
puts "To play the matching game type '-play'."
puts "To create new card type '-create'."
puts "To quit the game type '-exit'."
puts ""



command = ""
command = gets.chomp
while command != "-exit"


        case command
          when '-play'
            puts "We will show you a definition, you have three \n"
            puts "tries to guess the matching term. \n"
            puts "Currently the terms are case sensative."

            puts "Definition: #{@deck.current_card.definition}"
            print "What is the matching Term? "
            command = gets.chomp

             if @deck.guess_counter < 4
                @deck.guess(command)
             end

          when '-exit'
              puts ""
              puts "Goodbye!"
              puts ""
          when '-create'
              puts "what's the new term?"
              new_term = gets.chomp
              puts "What's the definition?"
              new_definition = gets.chomp
              new_card_string = "#{new_term}\t#{new_definition}\n"
              maker = Maker.new
              maker.add_new_card(new_card_string)
          else
            puts "You are in the else"

          end
end


#this is a change



