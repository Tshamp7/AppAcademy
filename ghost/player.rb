
class Player
    attr_reader :letters, :name
    attr_writer :letters
   def initialize(name)
    @name = name
    @letters = ""
   end

   def assign_letter
        case self.letters[-1]
        when nil
            @letters << "G"
        when "G"
            @letters << "H"
        when "H" 
            @letters << "O"
        when "O"
            @letters << "S"
        when "S" 
            @letters << "T"
            return true
        end
   end

   




end

