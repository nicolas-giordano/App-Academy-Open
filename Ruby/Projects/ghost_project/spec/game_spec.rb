require "game"

describe "Game" do
    let(:player1) {Player.new("Joe")}
    let(:player2) {Player.new("Bob")}
    subject(:game) {Game.new(player1, player2)}

    describe "#initialize" do
        it "should accpet two players as args" do
            game
        end
        it "should have instance variables @current_player and @previous_player where player_1 would be the first `current` player." do
            expect(game.instance_variable_get(:@current_player)).to be(player1)
            expect(game.instance_variable_get(:@previous_player)).to be(player2)
        end
        it "should have an instance variable @fragment which should initialize as an empty string" do
            expect(game.instance_variable_get(:@fragment)).to eq("")
        end
        it "should have an instance variable @dictionary which should initialize as an empty dictionary" do
            expect(game.instance_variable_get(:@dictionary)).to eq({})
        end
    end

    describe "#current_player" do
        it "should return player instance of the player who's turn it currently is" do
            expect(game.current_player).to be(game.instance_variable_get(:@current_player))
        end
    end

    describe "#previous_player" do
        it "should return player instance of the player who's turn it last was" do
            expect(game.previous_player).to be(game.instance_variable_get(:@previous_player))
        end
    end

    describe "#next_player!" do
        it "should swap current_player with previous_player" do
            curr = game.current_player
            prev = game.previous_player
            expect(game.current_player).to be(game.instance_variable_get(:@current_player))
            expect(game.previous_player).to be(game.instance_variable_get(:@previous_player))
            game.next_player!
            expect(game.current_player).to be(prev)
            expect(game.previous_player).to be(curr)
        end
    end
            
end