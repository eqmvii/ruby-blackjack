class Card
    def initialize (suit, value, name)
        @suit = suit
        @value = value
        @name = name
    end

    def speak
        puts "I am #{@name}. My suit is #{@suit} and my value is #{@value}."
    end

end
