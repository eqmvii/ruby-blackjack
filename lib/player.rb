class Player

    attr_reader :name

    def initialize(type, starting_balance = 10000)
        @name =
            if type == :human
                puts "What is your name?"
                gets.chomp
            else
                "[Computer]"
        end
        @starting_balance = starting_balance
    end

    def print_info
        puts "Hello, I am #{@name} and I have $#{@starting_balance}" # TODO print numbers better
    end

end
