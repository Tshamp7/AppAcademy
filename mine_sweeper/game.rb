require_relative "board"
require_relative "square"


class Game
    attr_accessor :board, :game_over
    def initialize
        puts "Please choose the difficulty you would like to play on. The available choices are: Beginner, Normal, Hard, and Hell."
        difficulty = gets.chomp
        @board = Board.new(difficulty)
        @won = false
        @game_over = false
        @turn = 0
    end

    def get_pos
        puts "Please enter the coordinates of the positions you would like to act upon. Use the form 'row,col'."
        puts "> "
        pos = parse_pos(gets.chomp)
        pos
    end

    def get_action
        puts "Please enter the action you would like to take. Type 'r' to reveal a square or 'f' to flag a square."
        puts "> "
        input = gets.chomp
        input
    end

    def parse_pos(string)
        pos = string.split(",").to_a
        pos.map!(&:to_i)
        pos
    end

    def run
        self.board.populate
        until @won == true || @game_over == true
            @board.render
            self.reveal(self.get_pos, self.get_action)
            @board.render
        end
    end

    def won?
       


    end


    def reveal(arr, str)
        row, col = arr[0], arr[1]
        current_square = self.board.grid
        if current_square == nil
            return false
        end
            if str == "f" || str == "F"
                current_square[row][col].flag
            elsif current_square[row][col].mine == true
                puts "Kabooooom!, youve hit a mine!"
                puts "Game Over!"
                @game_over = true
            elsif current_square[row][col].value == "F"
                puts "You cannot reveal a flagged square. Please unflag this square before choosing it."
            elsif (str == "r" || str == "R") && current_square[row][col].mine == false && current_square[row][col].value == "*" || current_square[row][col].value == "_"
                current_square[row][col].reveal_blank
                if !current_square[row - 1][col].mine && !current_square[row][col + 1].mine && !current_square[row + 1][col].mine && !current_square[row][col - 1].mine
                    self.reveal(self.up(arr), "r")
                    self.reveal(self.right(arr), "r")
                    self.reveal(self.down(arr), "r")
                    self.reveal(self.left(arr), "r")
                end
            end
    end

    def up(arr)
        row, col = arr[0], arr[1]
        return [row - 1, col]
    end

    def right(arr)
        row, col = arr[0], arr[1]
        return [row, col + 1]
    end

    def down(arr)
        row, col = arr[0], arr[1]
        return [row + 1, col]
    end

    def left(arr)
        row, col = arr[0], arr[1]
        return [row, col - 1]
    end



end

my_game = Game.new

my_game.run


