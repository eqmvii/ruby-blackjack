# TODO: access_attr etc.

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
                value =
                    if i > 10
                        10
                    else
                        i
                    end
                name =
                    if i == 1
                        "Ace"
                    elsif i == 11
                        "Jack"
                    elsif i == 12
                        "Queen"
                    elsif i == 13
                        "King"
                    else
                        i.to_s
                    end
                @cards_array << Card.new(suit, value, name)
            end
        end
        shuffle_deck

        # first_card = Card.new("Hearts", 2, "Two of Hearts")
        # @cards_array << first_card
    end

    def shuffle_deck
        @cards_array.shuffle!
    end

    def cards_remaining
        @cards_array.size
    end

    def deal
        @cards_array.pop
    end

    def print_info
        puts "I have #{cards_remaining} cards!"
    end

    def show_top_card
        @cards_array.first.speak
    end

end
