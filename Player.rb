require_relative "SecretCode"
require_relative "Display"

# Player class
class Player
    # How many guesses before the game is over?
    @@GUESSES = 12

    attr_accessor :guesses, :colors

    def initialize
        @guesses = @@GUESSES
        @colors = []
    end

    # Get input from the player
    def take_player_input
        get_color_input
        Display.print_message("The colors you have selected are: #{@colors}")
    end

    # Helper function to make sure input is correct / valid colors
    def get_color_input
        i = 1
        while @colors.length != SecretCode.number_of_colors
            Display.print_message("Enter color number #{i}: ")
            color = gets.chomp
            color = color.downcase
            if !SecretCode.valid_colors.include?(color)
                puts "Color not available"
                Display.print_message("Avaiable colors are: #{SecretCode.valid_colors}")
            else 
                @colors.push(color)
                i += 1
            end
        end
    end

    # Send selected colors to SecretCode
    def send_selected_colors
        if @colors.length == SecretCode.number_of_colors
            SecretCode.create_feedback_pins(@colors)
        else
            Display.print_message("Incorrect number of colors in your selection")
        end      
    end

end

