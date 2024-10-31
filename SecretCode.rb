# Class for the secret code the player needs to guess
class SecretCode
  # color instance variables
  attr_accessor :color1, :color2, :color3, :color4
  @@CORRECT_CORRECT_POSITION_PIN = 1
  @@CORRECT_WRONG_POSITION_PIN = 2

  def initialize(color1, color2, color3, color4)
    @color1 = color1
    @color2 = color2
    @color3 = color3
    @color4 = color4  
    @colors = [color1, color2, color3, color4]
    @pins = []
  end

  def guess_feedback(guess_color1, guess_color2, guess_color3, guess_color4)
    # correct guess?
    # correct guess in correct position?
    if guess_color1 == @color1
      pins.push(CORRECT_CORRECT_POSITION_PIN)
    elsif colors.include?(color1)
      pins.push(CORRECT_WRONG_POSITION_PIN)      
    end
  end
end