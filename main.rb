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
  p code.colors
  while !game_over?(player, code)
    # Take input from the player
    player.take_player_input
    # Generate feedback with pins
    code.create_feedback_pins(player.colors)
    # Show secret code for testing purposes
    Display.print_computer_color_selection(code.colors)
    player.guesses -= 1
    # If player guesses correct code in order, win
  end
end

# computer guesses the code
def computer_guesses(player, code)
  
    player.generate_computer_guess
    code.create_feedback_pins(player.colors)
    
    player.guesses -= 1

    Display.print_message("Computer guess is #{player.colors}")
    # The computer needs some kind of logic to handle the feedback (pins)
    # and adjust its next response
    

  
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
game_options = GameOptions.new

# Create code (player or computer, depending on the GameOptions object)
code = SecretCode.new(game_options.who_creates_code)
player = Player.new

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