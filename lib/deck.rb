require_relative 'card'

class Deck

    def initialize (cards = 52)
        # @cards = cards
        @cards_array = []

        # while cards > 0
        #     puts cards
        #     cards -= 1
        # end

        for i in 1..13
            for suit in ["Clubs", "Diamonds", "Hearts", "Spades"]
                name =
                    if i == 1
                        "Ace"
                    else
                        i.to_s
                    end
                @cards_array << Card.new(suit, i, name)
            end
        end
        shuffle

        # first_card = Card.new("Hearts", 2, "Two of Hearts")
        # @cards_array << first_card
    end

    def shuffle
        @cards_array.shuffle!
    end

    def cards_remaining
        @cards_array.size
    end

    def current_state
        puts "I have #{@cards} cards!"
    end

    def show_top_card
        @cards_array.first.speak
    end

end