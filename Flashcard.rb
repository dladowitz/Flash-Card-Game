require './deck.rb'
require './card.rb'
require './maker.rb'
require './session.rb'


# @deck = Deck.new('dictionary.txt')
# @deck.set_current_card

session = Session.new

puts ""
puts "\033[31mWelcome to the Flash Card App.\nYou can play a matching game or \nyou can create a new card.\033[0m\n"



# puts "We will show you a definition, you have three \n"
# puts "tries to guess the matching term. \n"
# puts "Currently the terms are case sensative."
puts ""
puts "\033[36mMain Menu.\033[0m"
puts "To play the game type \033[32m-play\033[0m."
puts "To create a new card \033[32m-create\033[0m."
puts "To quit the game type \033[32m-exit\033[0m."
puts ""


puts "\033[36mWhat do you want to do: \033[0m"
$command = ''
$command = gets.chomp
puts ""


while $command != "-exit"

      case $command

      when "-create"
        session.create

      when "-play"
        session.play

      when "-exit"
        puts ""
        puts "Goodbye!"
        puts ""
        $command = "-exit"

      when '-pre-exit'
        puts ""
        puts "\033[36mYou are back in the main menu.\033[0m"
        puts "To play the game type \033[32m-play\033[0m."
        puts "To create a new card \033[32m-create\033[0m."
        puts "To quit the game type \033[32m-exit\033[0m."
        puts ""

        puts "\033[36mWhat do you want to do: \033[0m"
        $command = gets.chomp
      else
        puts "\033[31mThat ain't no command I know!\033[0m"
        puts "To play the game type \033[32m-play\033[0m."
        puts "To create a new card \033[32m-create\033[0m."
        puts "To quit the game type \033[32m-exit\033[0m."
        puts ""
        $command = gets.chomp

      end
end




