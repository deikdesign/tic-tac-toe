player_1, player_2 = "", ""
team_1, team_2 = "", ""
first_turn = 0
player_move = ""

while player_1.empty?
    puts "Please write the name of the PLAYER 1: "
    player_1 = gets.chomp.capitalize
end

loop do
    puts "Please select your Team (X or O): "
    team_1 = gets.chomp.upcase
    if team_1 == "O" or team_1 == "X"
        break
    end
end

while player_2.empty?
    puts "Please write the name of the PLAYER 2: "
    player_2 = gets.chomp.capitalize
end

if team_1 == "O"
    team_2 = "X"
elsif team_1 == "X"
    team_2 = "O"
end

# WE DISPLAY THE NAMES AND TEAMS OF EACH PLAYER
# ASK WHO WILL BEGIN FIRST

loop do
    puts "1 - Player 1: #{player_1} (#{team_1})"
    puts "2 - Player 2: #{player_2} (#{team_2})"
    puts "Who wants to be first? (put 1 or 2): "

    first_turn = gets.chomp.to_i

    if first_turn == 1 or first_turn == 2
        break
    end

end

if first_turn == 1
    puts "Ok great! So first move is for #{player_1} (#{team_1})"
elsif first_turn == 2
    puts "Ok great! So first move is for #{player_2} (#{team_1})"
end

# SHOW THE BOARD

puts "Please make your move ( 1 ... 9 ) :"


loop do
    player_move = gets.chomp.to_i

    if player_move < 1 and player_move > 9
        puts "Please make your move again (1 ... 9): "
    end
break if (1..9).include?(player_move)
end

puts "Your move was #{player_move}"

# CHANGE THE BOARD WITH THE MOVE


# CHANGE TURN
puts "Please make your move from (1...9)?"
puts "Your move was #{player_move}"

# SHOW UPDATED BOARD


# RUN THE NEXT TURN

# FINISH WHEN WE HAVE A WINNER OR A TIE
winner = false
if winner == true
    puts "Congratulations, you are the winner"
elsif winner == false
    puts "You lose. Please try again."
end
# ASK IF THE USER WANT TO PLAY AGAIN
print "Do you want to play again? Y/N"
loop do
    play_again = gets.chomp.upcase
    if play_again != "Y" || play_again != "O" 
        puts "Do you want to play again?"
    end
break if play_again == "Y" || play_again == "O"
end

puts "Your move was #{player_move}"
if user_input == "N"
    puts "Please, try again"
end



