require_relative "Display"

# Class for the secret code the player needs to guess
class SecretCode

  # SecretCode class variables
  @@CORRECT_CORRECT_POSITION_PIN = 1
  @@CORRECT_WRONG_POSITION_PIN = 2
  @@NUMBER_OF_COLORS = 4
  @@VALID_COLORS = ["white", "black",  "red", "green"]

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

  def initialize(color1, color2, color3, color4)  
    @colors = [color1, color2, color3, color4]
    @pins = []
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

  end

  def print_pins
    Display.print_pins(@pins)
  end

end

=begin
secret = SecretCode.new("white", "blue", "orange", "red")
secret.create_feedback_pins(["red", "orange", "blue", "white"])
p secret

SecretCode.valid_colors
=end