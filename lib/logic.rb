class Player
    attr_accessor :name, :team
    def initialize(name, team)
        @name = name
        @team = team
    end
end


class Board
    attr_reader :board, :moves_done
    def initialize
        @@board = [1,2,3,4,5,6,7,8,9]
        @@moves_done = []
    end

    def make_move(team, move)
        done = false
        if team == "X" and @@moves_done.none?(move)
            @@board[move-1] = "X"
            @@moves_done.push(move)
            done = true
        elsif team == "O" and @@moves_done.none?(move)
            @@board[move-1] = "O"
            @@moves_done.push(move)
            done = true
        else
            done = false
        end
        done
    end

    def check_if_win?
        winner = false
        win_sets = [[0,1,2], [0,4,8], [0,3,6], [1,4,7], [2,5,8], [3,4,5], [6,7,8], [2, 4, 6]]
        win_sets.each do |p|
            if @@board[p[0]] == @@board[p[1]] and @@board[p[0]] == @@board[p[2]]
                winner = true
            end
        end
        winner
    end

    def check_if_move_done?(move)
        if @@moves_done.none?(move)
            return false
        else
            return true
        end
    end

    def show_board
        puts '+---+---+---+'
        puts '| '+@@board[0].to_s+' | '+@@board[1].to_s+' | '+@@board[2].to_s+' |'
        puts '+---+---+---+'
        puts '| '+@@board[3].to_s+' | '+@@board[4].to_s+' | '+@@board[5].to_s+' |'
        puts '+---+---+---+'
        puts '| '+@@board[6].to_s+' | '+@@board[7].to_s+' | '+@@board[8].to_s+' |'
        puts '+---+---+---+'
    end
end