require './lib/logic'

describe Game do
  let(:new_game) { Game.new }
  let(:player) { Player.new('Sergio', 'X') }
  describe '#make_move' do
    it 'return true if user move is correct' do
      expect(new_game.make_move(player.team, 4)).to eql TRUE
    end
    it 'return false if the move is not a number' do
      expect(new_game.make_move(player.team, 'string')).to eql FALSE
    end
    it 'return false if the move is not a number between 1-9' do
      expect(new_game.make_move(player.team, 12)).to eql FALSE
    end
  end

  describe '#check_if_win?' do
    it 'returns false when there is no winner' do
      expect(new_game.check_if_win?).to eql FALSE
    end
  end

  describe '#check_if_move_done?' do
    it 'returns false if there is no move already' do
      expect(new_game.check_if_move_done?(7)).to eql FALSE
    end

    it 'returns true if there is a move already' do
      expect(new_game.check_if_move_done?(3)).to eql TRUE
    end
  end
end
