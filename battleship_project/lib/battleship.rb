require_relative "board"
require_relative "player"

class Battleship
    attr_reader :player, :board


    def initialize(n)
        @board = Board.new(n)
        @player = Player.new
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "There have been #{@board.num_ships} placed."
        @board.print
    end

    def lose?
     if @remaining_misses <= 0
        print "you lose!"
        true
     else
        false
     end
    end

    def win?
        if @board.num_ships == 0
            print "you win!"
            true
        else
            false
        end
    end

    def game_over?
        if self.win? || self.lose?
            true
        else
            false
        end
    end

    def turn
        position = @player.get_move
        @remaining_misses -= 1 if !@board.attack(position) 
        print @remaining_misses
        @board.print
    end
end
