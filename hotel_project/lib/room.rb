class Room
    def initialize(num)
        @capacity = num
        @occupants = []
    end
  
    def capacity
     @capacity
    end

    def occupants
     @occupants
    end

    def full?
     if @occupants.length < @capacity
       false
     elsif @occupants.length == @capacity
        true
     end
    end

  def available_space
   @capacity - @occupants.length
  end

  def add_occupant(str)
     if self.full? == false
       @occupants << str
       return true
     else
        return false
     end
  end


end
