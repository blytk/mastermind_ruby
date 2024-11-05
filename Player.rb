require_relative "SecretCode"
require_relative "Display"

# Player class
class Player
    # How many guesses before the game is over?
    @@GUESSES = 12
    

    attr_accessor :guesses, :colors, :immutable_indexes

    def initialize
        @guesses = @@GUESSES
        @colors = []
        @immutable_indexes =  []
    end

    # Get input from the player
    def take_player_input
        get_color_input
        Display.print_message("Turn ##{@@GUESSES - @guesses + 1}")
        # Display.print_message("The colors you have selected are: #{@colors}")
        Display.print_player_color_selection(@colors)
    end

    # Helper function to make sure input is correct / valid colors
    def get_color_input
        i = 1
        # reset @colors array to get new input from the user
        @colors = []
        # Message
        Display.print_message("Turn ##{@@GUESSES - @guesses + 1}")
        # Logic to compare player input against code
        while @colors.length != SecretCode.number_of_colors
            Display.print_message("Enter color number #{i}: ")
            color = gets.chomp
            color = color.downcase
            if !SecretCode.valid_colors.include?(color)
                puts "Color not available"
                Display.print_message("Available colors are: #{SecretCode.valid_colors}")
            else 
                @colors.push(color)
                i += 1
            end
        end
    end

    def generate_computer_guess(player, code, feedback_pins)
        # Implement feedback
        # if feedback_pins empty
        p @immutable_indexes
        if feedback_pins.length <= 0
              # reset @colors array no previous color was correct
              @colors = []
              # Populate all elements of @colors with random values
              SecretCode.number_of_colors.times do 
                @colors.push(SecretCode.valid_colors[rand(SecretCode.valid_colors.length)])
              end
        else
            feedback_pins.each do |pin|
                if pin == 1 #red pin is 1, white pin is 2
                  @colors.each_with_index do |color, index|
                    if @colors[index] == code.colors[index]
                        # make it so this color won't change
                        # @colors at these indexes should never change
                        if !@immutable_indexes.include?(index)
                            @immutable_indexes.push(index)
                        end
                    end    
                  end

                end
            end

            @colors.each_with_index do |color, index|
                if @immutable_indexes.include?(index)
                  next
                else
                    @colors[index] = SecretCode.valid_colors.sample
                end
            end
        end


  
          # Message
          Display.print_message("Turn ##{@@GUESSES - @guesses + 1}. The computer is guessing...")

 #         # Push guesses into colors array
 #         while @colors.length != SecretCode.number_of_colors
 #           @colors.push(SecretCode.valid_colors[rand(SecretCode.valid_colors.length)])
 #         end
  
          
  
          Display.print_computer_color_selection(@colors)
  
    end

end
    


