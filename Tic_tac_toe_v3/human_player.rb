require "./board"
require "./game"
require "./computer_player"

class Human_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "Player #{self.mark} please choose a number pair from the following valid coordinates #{legal_positions} in the format 'num1 num2' "
        pos = gets.chomp
        position = [pos[0].to_i, pos[2].to_i]

        valid = false

        while valid == false

            if legal_positions.include?(position)
                valid = true
                return position
            end
            
            puts "That entry is not a valid position, please enter a valid, empty positon on the game board."
            pos = gets.chomp
            position = [pos[0].to_i, pos[2].to_i]
        end

    end
        
    







end