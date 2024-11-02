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
        print @@red_pin
        print " |"
      elsif pin == 2
        print "| "
        print @@white_pin
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

end

