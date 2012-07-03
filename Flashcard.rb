require './deck.rb'
require './card.rb'
require './maker.rb'

@deck = Deck.new('dictionary.txt')
@deck.set_current_card

puts "Welcome to the Flash Card App.
      You can play a matching game or
      you can create a new card."



# puts "We will show you a definition, you have three \n"
# puts "tries to guess the matching term. \n"
# puts "Currently the terms are case sensative."
puts ""
puts "To quit the play the game type '-play'."
puts "To create a new card '-create'."
puts "To quit the game type '-exit'."
puts ""


puts "What do you want to do: "
command = ''
command = gets.chomp


while command != "-exit"

      case command
      when "-create"
            puts "What's the term?"
            new_term = gets.chomp
            if new_term == '-exit'
              command = '-exit'
            else
              puts "What's the definition?"
              new_definition = gets.chomp
              if new_definition == '-exit'
                command = '-exit'
                else
                  new_card = "#{new_term}\t#{new_definition}\n"
                  maker = Maker.new
                  maker.add_new_card(new_card)
                end
              end

      when "-play"
        # input = ""
        # while input != '-exit'
            puts "Definition: #{@deck.current_card.definition}"
            print "What is the matching Term? "
            input = gets.chomp

            if input == '-exit'
              command = '-exit'
            else
              @deck.guess(input)
            end


            # puts "What do you want to do: "
            #             command = gets.chomp

        # end

      when "-exit"
          puts ""
          puts "Goodbye!"
          puts ""
          command = "-exit"
      end

end




