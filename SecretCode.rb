# Class for the secret code the player needs to guess
class SecretCode
  # SecretCode class variables
  # Represent the pins
  @@CORRECT_CORRECT_POSITION_PIN = 1
  @@CORRECT_WRONG_POSITION_PIN = 2

  # color instance variables
  attr_accessor :colors, :pins

  def initialize(color1, color2, color3, color4)  
    @colors = [color1, color2, color3, color4]
    @pins = []
  end

  def create_feedback_pins(guess_array)
    guess_array.each_with_index do |guess, guess_index|

      # correct guess in correct position?
      if guess == @colors[guess_index]
        @pins.push(@@CORRECT_CORRECT_POSITION_PIN)
      # correct guess but in different position?
      elsif @colors.include?(guess)
        @pins.push(@@CORRECT_WRONG_POSITION_PIN)
      end

    end
  end

end

secret = SecretCode.new("white", "blue", "orange", "red")
secret.create_feedback_pins(["red", "orange", "blue", "white"])
p secret