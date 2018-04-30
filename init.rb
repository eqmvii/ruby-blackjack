require_relative 'lib/deck'

def main
    puts "Welcome to BlackJack!"

    the_deck = Deck.new
    the_deck.current_state
    puts "Remove and reveal a card from the deck?"
    choice = gets.chomp
    puts "You chose #{choice.downcase}"
    if choice == "yes"
        puts "Revealing the top card!"
        the_deck.discard_top.speak
        puts "again? (y/n)"
        choice_two = gets.chomp
        while choice_two.downcase == "y"
            the_deck.discard_top.speak
            puts "again? (y/n)"
            choice_two = gets.chomp
        end

    else
        puts "Fine."
    end

    puts "The program had concluded."

end



main
