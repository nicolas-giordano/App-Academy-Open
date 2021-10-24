require "player"

describe "Player" do
    subject(:player) {Player.new("joe")}

    describe "#initialize" do
        it "should take in a name as an arg" do
            player
        end
        it "should have an instance variable @name set to the name passed in" do
            expect(player.instance_variable_get(:@name)).to eq("joe")
        end
    end

    describe "#guess" do 
        it "should ask user for input" do
            expect {player.guess}.to output(/Enter a guess/).to_stdout
        end

        it "should call chomp on the input from the user" do
            guess = double("abc\n", :chomp => "abc")
            allow(player).to receive(:gets).and_return(guess)
            expect(guess).to receive(:chomp)
            expect(player).to receive(:gets)
            player.guess
        end
    end
            
end