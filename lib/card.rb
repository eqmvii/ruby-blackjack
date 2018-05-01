class Card

    attr_reader :value, :name, :long_name

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

    # Flips the card and returns a copy of itself
    def flip
        @facing_up = !@facing_up
        self
    end

    def look_at
        if @facing_up
            "[#{@name}]"
        else
            "[Face Down Card]"
        end
    end

    def make_face_up
        @facing_up = true
    end

end
