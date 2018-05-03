# TODO: Clean up code, make multiple turns work, add gambling, add strategy
# TODO: Bug - computer just hits all the time lol

require_relative 'deck'
require_relative 'hand'
require_relative 'player'


class Blackjack

    def initialize
        @wins = 0
        @draws = 0
        @losses = 0
        @game_over = false
        @playing = true
    end

    def play
        puts "Welcome to BlackJack!"

        @the_deck = Deck.new
        @player = Player.new(:human)
        @computer = Player.new(:computer)
        # @player.print_info
        puts " "
        puts "% % % % % % % % % % % % % % % % % % % %"
        puts " "
        # @the_deck.print_info

        while @playing
            @game_over = false
            deal_hand
            puts " "
            puts "| #{@wins} wins, #{@draws} draws, #{@losses} losses |"
            puts " "
            puts "Again (y/n)?"
            again = gets.chomp.downcase
            if again != "y"
                @playing = false
            end
        end

        puts "Goodbye!"
    end

    def deal_hand
        @player_hand = Hand.new(@player)
        @computer_hand = Hand.new(@computer)

        @player_hand.draw(@the_deck.deal)
        @player_hand.draw(@the_deck.deal)
        @player_hand.print_info
        if check_for_win(@player_hand)
            @game_over = true
            @wins += 1
            return
        end

        @computer_hand.draw(@the_deck.deal.flip)
        @computer_hand.draw(@the_deck.deal)
        @computer_hand.look_at
        if check_for_win(@computer_hand)
            @game_over = true
            @wins += 1
            return
        end

        player_loop
        computer_loop

    end

    def player_loop
        puts "(H)it or (S)tay?"
        choice = gets.chomp.downcase
        # puts "Choice is: #{choice} with length #{choice.length}"
        while choice == 'h' || choice == 'hit'
            puts " "
            puts "% % % % % % % % % % % % % % % % % % % %"
            puts " "
            @player_hand.draw(@the_deck.deal)
            @player_hand.print_info
            @computer_hand.look_at
            if check_for_win(@player_hand)
                @game_over = true
                return
            end
            puts "(H)it or (S)tay?"
            choice = gets.chomp
            # puts "Choice is: #{choice} with length #{choice.length}"
        end
        puts " "
        puts "% % % % % % % % % % % % % % % % % % % %"
        puts " "
        puts "Player stays. Computers turn: "
        sleep(1)
        @player_hand.print_info

    end

    # dealer hits if under 17
    def computer_loop
        return if @game_over

        @computer_hand.face_up_all
        @computer_hand.print_info
        while @computer_hand.hand_value < 17
            puts " "
            puts "% % % % % % % % % % % % % % % % % % % %"
            puts " "
            puts "Computer hits!"
            @computer_hand.draw(@the_deck.deal)
            @player_hand.print_info
            @computer_hand.print_info
            if check_for_win(@computer_hand)
                @game_over = true
                return
            end
            sleep(1)
        end

        declare_winner
    end

    # TODO: Refactor messy win logic
    def check_for_win(hand)
        if(hand.hand_value == 21)
            puts "#{hand.player.name} wins with #{hand.hand_value}!"
            # abort "Goodbye - #{hand.player.name} won!"
            if @player.name == hand.player.name
                @wins += 1
            else
                @losses += 1
            end
            true
        elsif(hand.hand_value > 21)
            puts "#{hand.player.name} went bust with #{hand.hand_value}!"
            # abort "Goodbye - #{hand.player.name} lost!"
            if @player.name == hand.player.name
                @losses += 1
            else
                @wins += 1
            end
            true
        else
            false
        end
    end

    def declare_winner
        if(@player_hand.hand_value > @computer_hand.hand_value)
            puts "#{@player_hand.player.name} wins with #{@player_hand.hand_value} vs. #{@computer_hand.player.name}'s #{@computer_hand.hand_value}!"
            # abort "Goodbye - #{@player_hand.player.name} won!"
            @wins += 1
        elsif(@computer_hand.hand_value > @player_hand.hand_value)
            puts "#{@computer_hand.player.name} wins with #{@computer_hand.hand_value} vs. #{@player_hand.player.name}'s #{@player_hand.hand_value}!"
            # abort "Goodbye - #{@computer_hand.player.name} won!"
            @losses += 1
        else
            puts "It's a tie at #{@player_hand.hand_value}"
            # abort "Goodbye - it was a tie!"
            @draws += 1
        end
    end

    # old test method
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
