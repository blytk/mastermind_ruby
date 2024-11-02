require_relative "SecretCode"
require_relative "Display"
require_relative "Player"

code = SecretCode.new("white", "white", "black", "black")
player = Player.new()
player.take_player_input

code.create_feedback_pins(player.colors)

# player.send_selected_colors


# Display.print_pins([1, 2, 2, 1])
# Display.print_message("TESTING MESSAGE")

# SecretCode.available_colors