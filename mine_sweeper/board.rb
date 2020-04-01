require_relative "square"

class Board
    attr_reader :num_mines, :grid, :free_spaces
    attr_writer :grid


    def initialize(difficulty)
        @grid = Array.new(9) { Array.new(9) {Square.new(false)} }
        @num_mines = self.number_of_mines(difficulty)
        @free_spaces = 81 - @num_mines
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

        while @num_mines > 0
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

    def render_mines
        puts "  #{(0..8).to_a.join(" ")}"
        self.show_mines.each_with_index do |row, idx|
            puts "#{idx} #{row.join(" ")}"
        end
    end


    def row_values
      output = grid.map do |row|
            row.map do |square|
                square.value
            end
        end
    end

    def show_mines
        output = grid.map do |row|
              row.map do |square|
                if square.mine?
                    "M"
                else
                    "_"
                end
            end
        end
    end

    def count_revealed_blanks
        count = 0
        @grid.each do |row|
            row.each do |square|
                count += 1 if square.value == "_"
            end
        end

        count
    end

 




end
my_board = Board.new("Hell")

my_board.render

p my_board.count_revealed_blanks
