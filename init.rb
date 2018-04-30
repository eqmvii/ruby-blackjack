require_relative 'lib/deck'

def main
    puts "Welcome to BlackJack!"

    the_deck = Deck.new
    the_deck.current_state
    puts "Reveal top card of the deck?"
    choice = gets.chomp
    puts "You chose #{choice.downcase}"
    if choice == "yes"
        puts "Revealing the top card!"
        the_deck.show_top_card
    else
        puts "Fine."
    end

    puts "The program had concluded."

end



main
