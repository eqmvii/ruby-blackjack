class Card

    attr_reader :value, :name

    def initialize (suit, value, name, long_name)
        @suit = suit
        @value = value
        @name = name
        @long_name = long_name
        @facing_up = false
    end

    def print_info
        # puts "I am #{@name}. My suit is #{@suit} and my value is #{@value}."
        puts @long_name
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
