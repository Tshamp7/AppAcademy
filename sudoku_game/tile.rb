require "colorize"

class Tile
    attr_reader :value
   def initialize(num)
    @value = num
    @given = num == 0 ? true : false
   end

   def given?
    @given
   end

   def value=(new_value)
        if given?
            @value = new_value
        else
            puts "You can only change the value of a given tile. Please choose a given tile."
        end
    end

    def color
        given? ? :blue : :red
    end

    def given?
        @given
    end


end