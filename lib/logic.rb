# Saving Player information
class Player
  attr_accessor :name, :team
  def initialize(name, team)
    @name = name
    @team = team
  end
end

# Saving Game information and game actions methods
class Game
  attr_reader :board, :moves_done
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @moves_done = [3]
  end

  def make_move(team, move)
    if !move.is_a?(Integer) || !(1..9).include?(move)
      return false
    elsif (team == 'X') && @moves_done.none?(move)
      @board[move - 1] = 'X'
      @moves_done.push(move)
      return true
    elsif (team == 'O') && @moves_done.none?(move)
      @board[move - 1] = 'O'
      @moves_done.push(move)
      true
    end
    false
  end

  def check_if_win?
    winner = false
    win_sets = [[0, 1, 2], [0, 4, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [3, 4, 5], [6, 7, 8], [2, 4, 6]]
    win_sets.each do |p|
      winner = true if @board[p[0]] == @board[p[1]] && @board[p[0]] == @board[p[2]]
    end
    winner
  end

  def check_if_move_done?(move)
    @moves_done.none?(move) ? false : true
  end

  def show_board
    puts '+---+---+---+----+---+---+----+'
    puts "|    #{@board[0]}    |    #{@board[1]}    |    #{@board[2]}    |"
    puts '+---+---+---+----+---+---+----+'
    puts "|    #{@board[3]}    |    #{@board[4]}    |    #{@board[5]}    |"
    puts '+---+---+---+----+---+---+----+'
    puts "|    #{@board[6]}    |    #{@board[7]}    |    #{@board[8]}    |"
    puts '+---+---+---+----+---+---+----+'
  end
end
