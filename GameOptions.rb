require_relative "Display"

# Class for the game options: player guesses or creates the code
class GameOptions
attr_reader :who_creates_code

  def initialize
    Display.print_message("If you want to create the secret code, enter 'player', if you want to guess the code created by the computer, enter anything else")
    @who_creates_code = gets.chomp.downcase
  end

end
