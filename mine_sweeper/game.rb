require_relative "board"
require_relative "square"


class Game
    def initialize
        puts "Please choose the difficulty you would like to play on. The available choices are: Beginner, Normal, Hard, and Hell."
        difficulty = gets.chomp
        @Board = Board.new(difficulty)
        @won = false
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

    def reveal(arr, str)
        row, col = arr[0], arr[1]
        if self.grid[row][col].mine == true
            puts "Kabooooom!, youve hit a mine!"
            puts "Game Over!"
        elsif self.grid[x][y].
    end

    def up(arr)
        row, col = arr[0], arr[1]
        if self.grid[row - 1][col].mine == false || self.grid[row - 1][col].mine == nil
            return true
        end
    end

    def right(arr)
        row, col = arr[0], arr[1]
        if self.grid[row][col + 1].mine == false || self.grid[row][col + 1].mine == nil
            return true
        end
    end

    def down(arr)
        row, col = arr[0], arr[1]
        if self.grid[row + 1][col].mine == false || self.grid[row + 1][col].mine == nil
            return true
        end
    end

    def left(arr)
        row, col = arr[0], arr[1]
        if self.grid[row][col - 1].mine == false || self.grid[row][col - 1].mine == nil
            return true
        end
    end



end