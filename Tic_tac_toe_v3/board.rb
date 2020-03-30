class Board
    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_' ) }
    end

    def valid?(pos)
        if @grid[pos[0]][pos[1]] != nil
            return true
        else
            return false
        end
    end

    def empty?(pos)
        if @grid[pos[0]][pos[1]] == "_"
            return true
        end
    end

    def place_mark(pos, mark)
        if self.empty?(pos) == true && self.valid?(pos) == true
            @grid[pos[0]][pos[1]] = mark  
        elsif self.valid?(pos) == false
            raise puts "This space is not valid! Please choose a grid coordinate within the grid bounds. Please enter a valid number."
        elsif self.empty?(pos) != true
            raise puts "This space is full! Please enter a valid number." 
        end
    end

    def print
        (0...self.grid.length).each do |i|
            p self.grid[i]
        end
    end

    def win_row?(mark)
        self.grid.each do |row|
            if row.uniq.length == 1 && row.uniq.include?(mark)
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        self.grid.transpose.each do |col|
            if col.uniq.length == 1 && col.uniq.include?(mark)
                return true
            end
        end
        return false
    end

    def win_diagonal?(mark)
        count1 = 0
        count2 = 0
        rev_grid = []

        (0...self.grid.length).each do |i|
            rev_grid << grid[i].reverse
        end

        (0...self.grid.length).each do |i|
          count1 += 1 if self.grid[i][i] == mark
        end

        (0...self.grid.length).each do |i|
            count2 += 1 if rev_grid[i][i] == mark
        end

        if count1 == self.grid.length || count2 == self.grid.length 
            return true
        else
            return false
        end
    end

    def win?(mark)
        if self.win_col?(mark) || self.win_row?(mark) || self.win_diagonal?(mark)
            true
        else
            false
        end
    end

    def empty_positions?
        self.grid.each do |sub_array|
            if sub_array.include?("_")
                return true   
            end
        end
        false
    end

    def legal_positions
        output = []
        self.grid.each_with_index do |sub_array, i|
            sub_array.each_with_index do |ele, i2|
                if ele == "_"
                    output << [i, i2]
                end
            end
        end
        output
    end








end

