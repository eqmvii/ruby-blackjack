class Hand

    attr_reader :player

    def initialize (player)
        @player = player
        # @cards = cards
        @cards_array = []
        @aces = 0
    end

    def print_info
        hand_string = "(#{hand_value}) #{@player.name}: "
        @cards_array.each do |card|
            hand_string += card.long_name
            hand_string += " | "
        end
        # hand_string += "(#{hand_value})"
        hand_string += "$"
        hand_string += @player.current_balance.to_s
        puts hand_string
    end

    def look_at
        hand_string = "#{@player.name}: "
        @cards_array.each do |card|
            hand_string += card.look_at
            hand_string += " | "
        end
        puts hand_string
    end

    def draw(card)
        # puts "I got called"
        @cards_array << card
        if card.name == "Ace"
            @aces += 1
        end
        # puts "Aces: #{@aces}"
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

        temp_aces = @aces
        while temp_aces > 0 && sum < 12
            sum += 10
            temp_aces -= 1
        end

        sum
    end

    def discard
        @cards_array = []
        @aces = 0
    end

    def face_up_all
        @cards_array.each do |card|
            card.make_face_up
        end
    end


end
