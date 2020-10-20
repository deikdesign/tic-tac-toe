require './lib/logic'

describe Game do
    let(:new_game) { Game.new }
    let(:player) { Player.new('Sergio', 'X')}
    describe '#make_move' do
        it 'return true if user move is correct' do
            expect(new_game.make_move(player.team, 3)).to eql TRUE
        end

        it 'return false if the move is not a number' do
            expect(new_game.make_move(player.team, "string")).to eql FALSE
        end

        it 'return false if the move is not a number' do
            expect(new_game.make_move(player.team, 12)).to eql FALSE
        end
    end
end