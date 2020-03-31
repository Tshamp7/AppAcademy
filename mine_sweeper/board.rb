require_relative "square"

class Board
    attr_reader :num_mines, :grid


    def initialize(difficulty)
        @grid = Array.new(9) { Array.new(9, Square.new(false)) }
        @num_mines = self.number_of_mines(difficulty)
        @blank_grid = display_grid = Array.new(9) {Array.new(9, "*")}
    end

    def number_of_mines(difficulty)
        if difficulty == "Beginner" || difficulty == "beginner"
            return 4
        elsif difficulty == "Normal" || difficulty == "normal"
            return 6
        elsif difficulty == "Hard" || difficulty == "hard"
            return 8
        elsif difficulty == "Hell" || difficulty == "hell"
            return 12
        end
    end

    def populate
        @num_mines
        used_pos = []

        while num_mines > 0
           mine_pos = self.rand_pos
           if !used_pos.include?(mine_pos)
                used_pos << mine_pos
                x, y = mine_pos[0], mine_pos[1]
                square = self.grid[x][y]
                square.mine = true
                @num_mines -= 1
           end
        end
    end

    def rand_pos
        [rand(8), rand(8)]
    end
 
    def render
        puts "  #{(0..8).to_a.join(" ")}"
        self.row_values.each_with_index do |row, idx|
            puts "#{idx} #{row.join(" ")}"
        end
    end

    def row_values
        rows = []
        self.grid.each do |row|
            row_values = []
            row.each do |square|
                row_values << square.value
            end
            rows << row_values
        end
       rows
    end

 




end

my_board = Board.new("Hell")

my_board.populate

my_board.render
