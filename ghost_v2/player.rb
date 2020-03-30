
class Player
    attr_reader :letters, :name, :wins, :ai
    attr_writer :letters, :wins
   def initialize(name)
    @name = name
    @ai = false
    @letters = ""
    @wins = 0
   end

   def assign_letter
        case self.letters
        when ""
            @letters += "G"
        when "G"
            @letters += "H"
        when "H" 
            @letters += "O"
        when "O"
            @letters += "S"
        when "S" 
            @letters += "T"
            return true
        end
   end

   




end

