class Card
    def initialize (suit, value, name)
        @suit = suit
        @value = value
        @name = name
        @facing_up = false
    end

    def print_info
        puts "I am #{@name}. My suit is #{@suit} and my value is #{@value}."
    end

    def flip
        @facing_up = !@facing_up
    end

    def look_at
        if @facing_up
            "[#{@name}]"
        else
            "[Face Down Card]"
        end
    end

end
