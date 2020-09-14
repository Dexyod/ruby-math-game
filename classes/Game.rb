class Game
  def initialize
    @players = []
    @round = 0
    @question_range = 20
    @current_player = nil
  end

  def initialize_game
    puts "Welcome to MATH"

    puts "Player 1 enter your name "
    player1 = Player.new(gets.chomp)
    @players.push(player1)

    puts "Player 2 enter your name "
    player2 = Player.new(gets.chomp)
    @players.push(player2)

    @current_player = @players[0]

    puts "Hello #{player1.name} and #{player2.name}... LET'S MATH!"
   
    while(@current_player.lives > 0)
      play_game
    end
    finish_game
  end

  def round_increment
    @round += 1    
  end

  def switch_player
    if(@current_player == @players[0])
      @current_player = @players[1]
    else
      @current_player = @players[0]
    end
  end

  def play_game
    # puts @current_player
    round_increment
    switch_player
    question = Question.new(@question_range)
    # puts @current_player
    puts "Round #{@round}!... FIGHT!"
    print "#{@current_player.name}: #{question.question}"

    guess = gets.chomp.to_i
    # p question.answer?(guess)
    if(question.answer?(guess))
      puts "#{@current_player.name}: YES! You are correct!"
    else
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.lose_life
    end
    puts "#{@players[0].name}: #{@players[0].lives}/3 vs #{@players[1].name}: #{@players[1].lives}/3"
    puts " ----- NEW TURN ----- "
  end

  def finish_game
    if(@current_player == @players[0])
      puts "#{@players[1].name} Wins! With a score of #{@players[1].lives}/3\n#{@players[0].name} YOU SUCK!!"
    else
      puts "#{@players[0].name} Wins! With a score of #{@players[0].lives}/3\n#{@players[1].name} YOU SUCK!!"
    end
    puts " ----- GAME OVER ----- "
    puts "Good bye!"
  end
end