class Board
    attr_reader :grid

    def initialize
    @grid = Array.new(3, '_') { Array.new(3, '_' ) }
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
        p self.grid[0]
        p self.grid[1]
        p self.grid[2]
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
        rev_grid = [grid[0].reverse, grid[1].reverse, grid[2].reverse]

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










end

