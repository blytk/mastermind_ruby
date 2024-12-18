require "pry-byebug"

require_relative "SecretCode"
require_relative "Display"
require_relative "Player"
require_relative "GameOptions"

# player guesses the code
def player_guesses(player, code)
  # remove
  # remove
  # remove
  while !game_over?(player, code)
    # Take input from the player
    player.take_player_input
    # Generate feedback with pins
    code.create_feedback_pins(player.colors)
    # Show secret code for testing purposes
    # Display.print_computer_color_selection(code.colors)
    player.guesses -= 1
    # If player guesses correct code in order, win
  end
end

# computer guesses the code
def computer_guesses(player, code)
    pins = code.create_feedback_pins(player.colors)
    player.generate_computer_guess(player, code, pins)
    player.guesses -= 1
    # Display.print_message("Computer guess is #{player.colors}")
    # player must press key to continue
    if player.guesses != 0 
      Display.print_message("Press any key for the computer to play the next turn.")
    end
    gets

end

# Game ending conditions
def game_over?(player, code)
  if player.guesses <= 0
     return true
  end
  
  if player.colors == code.colors
    return true
  end
end


# Initialize game options
def new_game
  # Initialize
  game_options = GameOptions.new
  # Create code (player or computer, depending on the GameOptions object)
  code = SecretCode.new(game_options.who_creates_code)
  player = Player.new  

  # Game loop

  while !game_over?(player, code)
    if game_options.who_creates_code == "player"
      # computer guesses colors flow
      computer_guesses(player, code)
    else
      # player guesses colors
      player_guesses(player,code)
    end
  
    if player.colors == code.colors
      Display.print_message("||||| Correct combination found |||||")
    end
  end

end

def new_game?
  Display.print_message("Do you want to play again? (y/n)")
  answer = nil
  while !["y", "Y", "n", "N",].include?(answer)
    answer = gets.chomp.downcase
  end

  if answer == "y"
    return true
  else
    return false
  end
end

# New game / repeat or exit loop
def game_loop
  new_game
  while true
    if new_game?
      new_game
    else
      return false
    end
  end
end

game_loop