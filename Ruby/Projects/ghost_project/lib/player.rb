class Player

    def initialize(name)
        @name = name
    end

    def guess
        p "Enter a guess"
        response = gets.chomp
        response
    end
    
end