require "./board"

class Human_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        numbers = "0123456789"
        puts "Player #{self.mark}, please enter two numbers separated by a space to select the position on the board where you would like to place your mark. Use the format row space col"
        pos = gets.chomp
        if (pos.length != 3 && !pos.include?(numbers)) && (pos[0] > @board.length - 1 && pos[2] > @board.length - 1)
            puts "That is not a valid selection, please ensure your entry is only composed of two numbers in the format row space column."
            pos = gets.chomp
        end
    
        position = [pos[0].to_i, pos[2].to_i]
        return position
    end

    







end