class Hand

    attr_reader :player

    def initialize (player)
        @player = player
        # @cards = cards
        @cards_array = []
        @aces = 0
    end

    def print_info
        puts "#{@player.name}'s hand (#{hand_value}): "
        @cards_array.each do |card|
            print card.print_info
        puts
        end
    end

    def draw(card)
        puts "I got called"
        @cards_array << card
        if card.name == "Ace"
            @aces += 1
        end
        puts "Aces: #{@aces}"
    end

    def has_an_ace?
        if @aces > 0
            true
        else
            false
        end
    end

    def hand_value
        sum = 0
        # TODO: use reduce?
        @cards_array.each do |card|
            sum += card.value
        end

        if has_an_ace?
            puts "Disclaimer: hand contains one or more aces"
            puts "Disclaimer: hand contains one or more aces"
            puts "Disclaimer: hand contains one or more aces"
        end

        sum
    end

    def discard
        @cards_array = []
        @aces = 0
    end


end
