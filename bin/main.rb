play_again = 'Y'
while play_again == 'Y'
  player_one = ''
  player_two = ''
  team_one = ''
  team_two = ''
  turn = 0
  player_move = ''
  plays = 0

  while player_one.empty?
    puts 'Please write the name of the PLAYER 1: '
    player_one = gets.chomp.capitalize
  end

  loop do
    puts 'Please select your Team (X or O): '
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

  # WE DISPLAY THE NAMES AND TEAMS OF EACH PLAYER
  # ASK WHO WILL BEGIN FIRST

  loop do
    puts "1 - Player 1: #{player_one} (#{team_one})"
    puts "2 - Player 2: #{player_two} (#{team_two})"
    puts 'Who wants to be first? (put 1 or 2): '

    turn = gets.chomp.to_i

    break if %w[1 2].include?(turn.to_s)
  end

  winner = false
  # SHOW THE BOARD (GONNA BE A METHOD)
  while winner == false

    # SHOW FIRST TURN INFORMATION, AFTER SELECTION
    if turn == 1
      puts "Ok great! So next move is for #{player_one} (#{team_one})"
    elsif turn == 2
      puts "Ok great! So next move is for #{player_two} (#{team_two})"
    end

    # BEGIN FIRST TURN (TURN IS GONNA BE A LOOP)
    puts 'Please make your move ( 1 ... 9 ): '
    loop do
      player_move = gets.chomp.to_i

      if player_move < 1 or player_move > 9
        puts 'Wrong. You have to put a number 1 to 9.'
        puts 'Please make your move again (1 ... 9): '
      end
      break if (1..9).include?(player_move)
    end

    puts "Your move was #{player_move}"

    # CHANGE THE BOARD WITH THE MOVE (GONNA BE A METHOD)
    # SHOW THE BOARD (GONNA BE A METHOD)

    puts '+---+---+---+'
    puts '| 1 | 2 | 3 |'
    puts '+---+---+---+'
    puts '| 4 | 5 | 6 |'
    puts '+---+---+---+'
    puts '| 7 | 8 | 9 |'
    puts '+---+---+---+'

    plays += 1

    # IF THERE IS ANY WINNER IT'S GONNA SHOW THE WINER INFORMATION:
    # FINISH WHEN WE HAVE A WINNER OR A TIE
    if winner == true
      puts 'Congratulations, you are the winner'
      break
    elsif plays == 9 and winner == false
      puts "It's a tie!"
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
  elsif play_again == 'N'
    puts 'Thanks for playing! Bye!'
    break
  end
end
