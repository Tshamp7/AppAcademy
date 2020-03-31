require_relative "board"


class Game
    def initialize
        puts "Please choose the difficulty you would like to play on. The available choices are: Beginner, Normal, Hard, and Hell."
        difficulty = gets.chomp
        @Board = Board.new(difficulty)
        @won = false
        @turn = 0
    end

    def get_input
        puts "Please enter the coordinates of the positions you would like to act upon. Use the form 'row,col'."
        pos = parse_pos(gets.chomp)


    end



    def parse_pos(string)
        pos = string.split(",").to_a
        pos.map!(&:to_i)
        pos
    end

    def reveal
        x, y = parse_pos(string)[0], parse_pos(string)[1]
        if self.grid[x][y].mine == true
            puts "Kabooooom!, youve hit a mine!"
            puts "Game Over!"
        elsif self.grid[x][y].
    end





end