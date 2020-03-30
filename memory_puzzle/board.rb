require_relative 'game'
require_relative 'card'



class Board
    attr_reader :grid_size, :cards, :grid, :blank_grid, :alpha
    attr_writer :cards, :grid, :blank_grid
    def initialize(size)
        @grid = Array.new(size) { Array.new(size, "_") }
        @cards = []
        @alpha = "abcdefghijklmnopqrstuvwxyz"
        @grid_size = size
    end

    def random_alpha_char
        char = self.alpha[rand(alpha.length - 1)]
        index = self.alpha.index(char)
        self.alpha.slice!(index)
        return char
    end

    def populate
        card_pairs = []
        while card_pairs.length < (self.grid_size * self.grid_size)
            random_face_value = self.random_alpha_char 
            card_pairs << Card.new(random_face_value)
            card_pairs << Card.new(random_face_value)
        end
        self.cards = card_pairs.shuffle
        
        self.grid.each do |array|
            array.each_index do |idx|
                array[idx] = @cards.shift
            end
        end
    end

    def won?
       self.grid.each do |arr|
        arr.each do |card|
            if card.face_up == false
                return false
            end
        end
       end
       puts "You have won!"
       return true
    end

    def render
        print_board = Array.new(self.grid_size) { Array.new(self.grid_size, "_") }
        self.grid.each_with_index do |ele, idx|
            ele.each_with_index do |card, idx2|
                if card.face_up == true
                    print_board[idx][idx2] = card.face_value
                else
                    print_board[idx][idx2] = "_"
                end
            end
        end
         
        print_board.each do |row|
            p row
        end

    end

    def reveal(guessed_pos)
        row, col = guessed_pos[0].to_i, guessed_pos[2].to_i
        
        if self.grid[row][col].face_up == false
            self.grid[row][col].face_up = true
        end
        self.render
        return self.grid[row][col]
    end

    def available_position
        positions = []
        self.grid.each_with_index do |row, idx1|
            row.each_with_index do |col, idx2|
                if col.face_up == true
                    positions << [idx1, idx2]
                end
            end
        end
        positions[rand(positions.length - 1)]
    end


end


