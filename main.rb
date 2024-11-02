require_relative "SecretCode"
require_relative "Display"
require_relative "Player"

# Initialize secret code that the player must guess
code = SecretCode.new("white", "white", "black", "black")
# Create player
player = Player.new()

def game_over?(player, code)
    if player.guesses <= 0
       true
    end
    
    if player.colors == code.colors
      Display.print_message("You have found the correct combination. You win.")
      true
    end
end

while !game_over?(player, code)
  # Take input from the player
  player.take_player_input
  # Generate feedback with pins
  code.create_feedback_pins(player.colors)
  player.guesses -= 1
  # If player guesses correct code in order, win
end







# Display.print_pins([1, 2, 2, 1])
# Display.print_message("TESTING MESSAGE")

# SecretCode.available_colors