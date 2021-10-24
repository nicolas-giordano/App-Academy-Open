class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end

    def num_ships
        total = 0
        @grid.each {|row| total += row.count(:S)}
        total
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        while num_ships < @size / 4
            @grid[rand(0...@grid.length)][rand(0...@grid.length)] = :S
        end
    end

    def hidden_ships_grid
        hidden = Array.new(@grid.length) {Array.new(@grid.length)}
        (0...hidden.length).each do |i|
            (0...hidden.length).each do |j|
                if self[[i,j]] == :S
                    hidden[i][j] = :N
                else
                    hidden[i][j] = self[[i, j]]
                end
            end
        end
        hidden
    end

    def self.print_grid(grid)
        grid.each do |row|
            row.each_with_index do |val, idx|
                print val.to_s
                if idx != grid.length - 1
                    print " "
                end
            end
            print "\n"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
    
end
