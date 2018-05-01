class Player

    def initialize(starting_balance = 10000)
        puts "What is your name?"
        @name = gets.chomp
        @starting_balance = starting_balance
    end

    def print_info
        puts "Hello, I am #{@name} and I have $#{@starting_balance}" # TODO print numbers better
    end

end
