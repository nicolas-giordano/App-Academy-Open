class Game

    attr_reader :current_player, :previous_player

    def initialize(player1, player2)
        @current_player = player1
        @previous_player = player2
        @fragment = ""
        @dictionary = {}
    end

    def next_player!
        @current_player, @previous_player = @previous_player, @current_player
    end
    
end