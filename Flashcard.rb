require './deck.rb'
require './card.rb'


@deck = Deck.new('dictionary.txt')
@deck.set_current_card

puts "Welcome to the Flash Card memorization game.\n"
puts "We will show you a definition, you have three \n"
puts "tries to guess the matching term. \n"
puts "Currently the terms are case sensative."
puts ""
puts "To quit the game type '-exit'."
puts ""



command = ""
while command != "-exit"
  # puts "Command = #{command}"
  puts "Definition: #{@deck.current_card.show_def}"
  print "What is the matching Term? "
  command = gets.chomp
  # puts "This is before the if block: #{input}"

        case command
          when '-exit'
              puts ""
              puts "Goodbye!"
              puts ""
          else
            if @deck.guess_counter < 4
              @deck.guess(command)
            end
          end
end


