require_relative "Display"

# Class for the game options: player guesses or creates the code
class GameOptions
attr_reader :who_creates_code

  def initialize
    Display.print_message("MASTERMIND")
    Display.print_message("If you want be the player and guess the code the computer creates, enter 1")
    Display.print_message("If you want to create the code and have the computer guess, enter 2")
    while (@who_creates_code != 1 && @who_creates_code != 2)
      @who_creates_code = gets.chomp.to_i
    end
    if @who_creates_code == 1
      @who_creates_code = "computer"
      Display.print_message("You have selected to be the player and guess the code")  
    elsif @who_creates_code == 2
      @who_creates_code = "player"
      Display.print_message("You have selected to create the code and have the computer guess")
    else
      Display.print_message("An error has occurred")
    end
    
  end

end
