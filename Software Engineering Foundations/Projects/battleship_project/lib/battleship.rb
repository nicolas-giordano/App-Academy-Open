require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "Placed #{@board.num_ships} ships on the board."
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        end
        false
    end
    
    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        end
        false
    end

    def game_over?
        if lose? || win?
            return true
        end
        false
    end

    def turn
        move = @player.get_move
        if !@board.attack(move)
            @remaining_misses -= 1
        end
        @board.print
        p "Remaining misses: #{@remaining_misses}."
    end
end
