require "awesome_print"
require_relative "tile"

class Board
    attr_accessor :grid
    def initialize(filename)
        @grid = self.populate(filename)
    end

    def populate(filename) #populates the board grid with tile instances each corresponding to a number value from the submitted sudoku text file. 
        rows = File.readlines(filename).map { |line| line.chomp }
        tiles = rows.map do |row|
            nums = row.split("").map(&:to_i)
            nums.map { |num| Tile.new(num) }
        end
    end

    def value_grid #converts the grid of tile objects into a 2d array of only the tile values. These values are also colorized. 
        output = @grid.map do |row|
            row.map do |tile|
                tile.value.to_s.colorize(tile.color)
            end
        end
        output
    end

    def render #renders the current board state as a series of stacked strings. Also outputs the index positions on the x and y axis.
        values = self.value_grid
        puts "    #{(0..8).to_a.join(" ")}"
        puts "---------------------"
        grid.each_with_index do |row, i|
            puts "#{i} | #{values[i].join(" ")}"
        end
    end

    def select_tile #stores a row-col position to select a tile to change. 
        puts "Please enter a blue tile coordinate that you would like to change in the format row col."
        pos = gets.chomp

        row = pos[0].to_i
        col = pos[1].to_i

        tile = self.grid[row][col]
        return tile
    end

    def change_tile #changes the value of tile selected using select-tile
        tile = self.select_tile
        puts "Please enter the number you would like to place at that locations.The number should be 1-9."
        number = gets.chomp.to_i
        tile.value = number
    end

    def check_row       #Checks to ensure the unique length of characters in each row is 9. 
        grid.each do |row|
            tile_values = []
            row.each do |tile|
                tile_values << tile.value
            end
            return false if tile_values.uniq.length != 9
            return false if tile_values.sum != 45
        end
        return true
    end

    def check_col         #transposes grid so rows now = columns. Then checks to make sure the lenght of unique chars in each row is 9. 
        trans_grid = grid.transpose

        trans_grid.each do |row|
            tile_values = []
            row.each do |tile|
                tile_values << tile.value
            end
            return false if tile_values.uniq.length != 9
            return false if tile_values.sum != 45
        end
        return true
    end

    def check_whole
        row_values = []
        tile_values = []
        grid.each do |row|
            row.each do |tile|
                tile_values << tile.value
            end
            row_values << tile_values
        end

      return false if (row_values.flatten.inject(:+) / 3) != 1215
      return true
    end 

    def won?
        if self.check_row && self.check_row && self.check_whole
            return true
        else
            return false
        end
    end
    







end



