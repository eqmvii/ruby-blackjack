class Hand

    def initialize ()
        # @cards = cards
        @cards_array = []
    end

    def print_info
        @cards_array.each do |card|
            puts card.print_info
        end
    end

    def draw(card)
        @cards_array << card
    end

end
