# TODO: Clean up code, make multiple turns work, add gambling, add strategy

require_relative 'deck'
require_relative 'hand'
require_relative 'player'


class Blackjack

    def play
        puts "Welcome to BlackJack!"

        @the_deck = Deck.new
        @player = Player.new(:human)
        @computer = Player.new(:computer)
        @player.print_info
        # @the_deck.print_info

        deal_hand

    end

    def deal_hand
        @player_hand = Hand.new(@player)
        @computer_hand = Hand.new(@computer)

        @player_hand.draw(@the_deck.deal)
        @player_hand.draw(@the_deck.deal)
        @player_hand.print_info
        check_for_win(@player_hand)

        @computer_hand.draw(@the_deck.deal.flip)
        @computer_hand.draw(@the_deck.deal)
        @computer_hand.look_at
        check_for_win(@computer_hand)

        player_loop
        computer_loop

    end

    def player_loop
        puts "(H)it or (S)tay?"
        choice = gets.chomp
        # puts "Choice is: #{choice} with length #{choice.length}"
        while choice == 'h'
            puts " "
            puts "% % % % % % % % % % % % % % % % % % % %"
            @player_hand.draw(@the_deck.deal)
            @player_hand.print_info
            @computer_hand.look_at
            check_for_win(@player_hand)
            puts "(H)it or (S)tay?"
            choice = gets.chomp
            puts "Choice is: #{choice} with length #{choice.length}"
        end
        puts " "
        puts "% % % % % % % % % % % % % % % % % % % %"
        puts "Player stays. Computers turn!"
        puts " "
        sleep(2)
        @player_hand.print_info

    end

    # dealer hits if under 17
    def computer_loop
        @computer_hand.face_up_all
        @computer_hand.print_info
        while @computer_hand.hand_value < 21
            puts " "
            puts "% % % % % % % % % % % % % % % % % % % %"
            puts "Computer hits!"
            @computer_hand.draw(@the_deck.deal)
            @computer_hand.print_info
            check_for_win(@computer_hand)
            sleep(2)
        end
    end

    def check_for_win(hand)
        if(hand.hand_value == 21)
            puts "VICTORY HAS BEEN ACHIEVED FOR #{hand.player.name}"
            abort "#{hand.player.name} WON!"
        elsif(hand.hand_value > 21)
            puts "CRUSHING DEFEAT FOR #{hand.player.name}"
            abort "#{hand.player.name} LOST!"
        end
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
