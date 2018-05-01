require_relative 'deck'
require_relative 'hand'
require_relative 'player'


class Blackjack

    def play
        puts "Welcome to BlackJack!"

        @the_deck = Deck.new
        @player = Player.new
        @player.print_info
        @the_deck.print_info



    end

    def deal_hand
        # TODO

    end

    def top_card_loop
        puts "Remove and reveal a card from the deck?"
        choice = gets.chomp
        puts "You chose #{choice.downcase}"
        if choice.downcase == "yes" || choice.downcase == "y"
            puts "Revealing the top card!"
            @the_deck.deal.print_info
            puts "again? (y/n)"
            choice_two = gets.chomp
            while choice_two.downcase == "y" || choice_two.downcase == "yes"
                @the_deck.deal.print_info
                @the_deck.print_info
                puts "again? (y/n)"
                choice_two = gets.chomp
            end

        else
            puts "Fine."
        end

        puts "The program had concluded."
    end


end
