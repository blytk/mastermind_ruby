require_relative "Display"

# Class for the secret code the player needs to guess
class SecretCode

  # SecretCode class variables
  @@CORRECT_CORRECT_POSITION_PIN = 1
  @@CORRECT_WRONG_POSITION_PIN = 2
  @@NUMBER_OF_COLORS = 4
  @@VALID_COLORS = ["black", "blue", "green", "red", "white", "yellow"]

  def self.valid_colors
    @@VALID_COLORS
  end

  def self.number_of_colors
    @@NUMBER_OF_COLORS
  end

  def self.available_colors
    print "Available colors are: "
    print "#{@@VALID_COLORS} \n" 
  end

  # color instance variables (colors of the secret code, and the feedback pins)
  attr_accessor :colors, :pins

  def initialize(who_creates_code)  
    @colors = []
    @pins = []  
    if who_creates_code == "player"
      player_sets_colors_array
    else
      computer_sets_colors_array
    end

    
  end

  def create_feedback_pins(guess_array)
    @pins = []
    # colors_to_compare is a secondary to avoid duplicity in include comparisons (not for direct comparisons)
    # to avoid duplicate white pins
    colors_to_compare = @colors.dup

    guess_array.each_with_index do |guess, guess_index|
      # correct guess in correct position?
      if guess == @colors[guess_index]
        @pins.push(@@CORRECT_CORRECT_POSITION_PIN)
        colors_to_compare[guess_index] = nil
        # colors_to_compare.delete_at(colors_to_compare.index(guess))
      end
    end

    # correct guess but in different position?
    
    guess_array.each_with_index do |guess, guess_index|
      if guess != @colors[guess_index] && colors_to_compare.include?(guess)
        @pins.push(@@CORRECT_WRONG_POSITION_PIN)
        # colors_to_compare.delete_at(colors_to_compare.index(guess))
        colors_to_compare[colors_to_compare.index(guess)] = nil
      end
    end

    print_pins
    # return the pins array for feedback (computer_guesses)
    pins

  end

  def print_pins
    Display.print_pins(@pins)
  end

  # Method to allow the user to create the secret color code
  def player_sets_colors_array
    SecretCode.available_colors
    color_to_insert = nil
    @@NUMBER_OF_COLORS.times do |i|
      Display.print_message("Enter color number #{i + 1}: ")
      while !@@VALID_COLORS.include?(color_to_insert)
        color_to_insert = gets.chomp.downcase
      end
      @colors.push(color_to_insert)
      color_to_insert = nil
    end
    Display.print_player_color_selection(@colors)
  end

  # Method to randomly create the secret color code
  def computer_sets_colors_array
    @@NUMBER_OF_COLORS.times do
      @colors.push(@@VALID_COLORS[rand(@@VALID_COLORS.length)])
    end
  end

end