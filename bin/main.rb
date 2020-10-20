#!/usr/bin/env ruby

require './lib/logic'

play_again = 'Y'
new_game = nil

while play_again == 'Y'
  if new_game.nil?
    player_one = ''
    player_two = ''
  end
  team_one = ''
  team_two = ''
  turn = 0
  player_move = ''
  plays = 0
  game = Game.new

  while player_one.empty?
    puts 'Please write the name of the PLAYER 1: '
    player_one = gets.chomp.capitalize
  end

  loop do
    puts "Please #{player_one} select your Team (X or O): "
    team_one = gets.chomp.upcase
    break if %w[O X].include?(team_one)
  end

  while player_two.empty?
    puts 'Please write the name of the PLAYER 2: '
    player_two = gets.chomp.capitalize
  end

  if team_one == 'O'
    team_two = 'X'
  elsif team_one == 'X'
    team_two = 'O'
  end

  p_one = Player.new(player_one, team_one)
  p_two = Player.new(player_two, team_two)

  # WE DISPLAY THE NAMES AND TEAMS OF EACH PLAYER
  #  AND ASK WHO WILL BEGIN FIRST

  loop do
    puts "1 - Player 1: #{p_one.name} (#{p_one.team})"
    puts "2 - Player 2: #{p_two.name} (#{p_two.team})"
    puts 'Who wants to be first? (put 1 or 2): '

    turn = gets.chomp.to_i

    break if %w[1 2].include?(turn.to_s)
  end

  # SHOW THE BOARD
  game.show_board

  while game.check_if_win? == false

    # SHOW FIRST TURN INFORMATION, AFTER SELECTION
    if turn == 1
      puts "Ok great! So next move is for #{p_one.name} (#{p_one.team})"
    elsif turn == 2
      puts "Ok great! So next move is for #{p_two.name} (#{p_two.team})"
    end

    # BEGIN FIRST TURN (TURN IS GONNA BE A LOOP)
    puts 'Please make your move ( 1 ... 9 ): '
    loop do
      player_move = gets.chomp.to_i

      if (player_move < 1) || (player_move > 9)
        game.show_board
        puts 'Wrong. You have to put a number 1 to 9.'
        puts 'Please make your move again (1 ... 9): '
      elsif game.check_if_move_done?(player_move)
        game.show_board
        puts 'The number you selected was already taken.'
        puts 'Try again with another number (1..9):'
      end
      break if (1..9).include?(player_move) && !game.check_if_move_done?(player_move)
    end

    puts "Your move was #{player_move}"

    # CHANGE THE BOARD WITH THE MOVE
    if turn == 1
      game.make_move(p_one.team, player_move)
    elsif turn == 2
      game.make_move(p_two.team, player_move)
    end

    # SHOW THE BOARD

    game.show_board

    plays += 1

    # IF THERE IS ANY WINNER IT'S GONNA SHOW THE WINER INFORMATION:
    # FINISH WHEN WE HAVE A WINNER OR A TIE
    if game.check_if_win? && turn == 1
      puts "Congratulations, you are the winner #{p_one.name}"
      break
    elsif turn == 2 && game.check_if_win?
      puts "Congratulations, you are the winner #{p_two.name}"
      break
    elsif (plays == 9) && (game.check_if_win? == false)
      puts "It's a tie!! Nobody wins until now.. but.."
      break
    end

    # WE CHANGE THE TURN VALUE AT THE END OF EACH PLAY:
    if turn == 1
      turn = 2
    elsif turn == 2
      turn = 1
    end
    # RUN THE NEXT TURN (GOES ON LOOP AGAIN)
  end

  # ASK IF THE USER WANT TO PLAY AGAIN
  puts 'Do you want to play again? Y/N: '
  play_again = nil
  loop do
    play_again = gets.chomp.upcase
    puts 'Do you want to play again? Y/N: ' if play_again != 'Y' || play_again != 'N'
    break if %w[Y N].include?(play_again)
  end

  if play_again == 'Y'
    # START THE GAME AGAIN
    new_game = false
  elsif play_again == 'N'
    puts 'Thanks for playing! Bye!'
    break
  end
end
