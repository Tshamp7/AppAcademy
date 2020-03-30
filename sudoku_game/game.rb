require_relative 'board.rb'

class Game
    attr_accessor :board, :won
    def initialize
        puts "Please input the filename of your sudoku game in the format 'filename.txt'."
        filename = gets.chomp
        @board = Board.new(filename)
        @won = false
    end

    def play_game
        while !won
            @board.render
            @board.change_tile
            system("clear")
            @board.render
            @won = true if @board.won?
        end
    end
end

