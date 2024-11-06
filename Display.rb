require "colorize"
# String.colorize(:color)

# Display class, to handle printing related tasks
class Display
  @@red_pin = "red pin"
  @@white_pin = "white pin"

  # Class methods
  def self.print_pins(pins_array)
    puts ""
    puts "PINS"
    puts "------------------------------------------------------------------------------------------------------------------"
    pins_array.each do |pin|
      if pin == 1 
        print "| "
        print @@red_pin.colorize(:red)
        print " |"
      elsif pin == 2
        print "| "
        print @@white_pin.colorize(:white)
        print " |"
      end
    end
    puts ""
    puts "------------------------------------------------------------------------------------------------------------------"
  end

  def self.print_message(message)
    puts ""
    puts "------------------------------------------------------------------------------------------------------------------"
    puts message
    puts "------------------------------------------------------------------------------------------------------------------"
  end

  def self.print_small_message(message)
    print message + "\n"
  end

  def self.print_player_color_selection(color_array)
    puts ""
    puts "The colors you have selected are: "
    puts "------------------------------------------------------------------------------------------------------------------"
    color_array.each do |color|
      print "| "
      print color.colorize(:"#{color}")
      print " |"
    end
    puts
    puts "------------------------------------------------------------------------------------------------------------------"
  end

  def self.print_computer_color_selection(color_array)
    puts ""
    puts "The colors the computer has selected are: "
    puts "------------------------------------------------------------------------------------------------------------------"
    color_array.each do |color|
      print "| "
      print color.colorize(:"#{color}")
      print " |"
    end
    puts
    puts "------------------------------------------------------------------------------------------------------------------"
  end

  def self.print_available_colors(color_array)
    puts "Available colors are: "
    color_array.each do |color|
      print color.colorize(:"#{color}")
      print " | "
    end
    puts
  end

end

