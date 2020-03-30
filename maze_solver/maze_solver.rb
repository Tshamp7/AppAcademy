require "byebug"
class Maze
    attr_accessor :maze_matrix, :end_pos, :start_pos, :curr_pos
    attr_writer :maze_matrix, :curr_pos, :visited
    attr_reader :curr_pos, :visited
    def initialize
            puts "Please enter the filename containing your maze to solve in the format 'filename.ext'"
            filename = gets.chomp
        @filename = filename
        @maze_matrix = []
        File.open("#{filename}", "r") do |file|
            file.each_line do |line|
                maze_matrix << line.chomp.chars
            end
        end
        
        @start_pos = self.find_position("S")
        @curr_pos = @start_pos
        @end_pos = self.find_position("E")
        @visited = []
    end

    def move_up
        if self.maze_matrix[@curr_pos[0] - 1][@curr_pos[1]] == "*" || @visited.include?([curr_pos[0] - 1, curr_pos[1]])
            return false
        end
        pos = self.curr_pos
        self.visited.push(pos)
        self.maze_matrix[pos[0]][pos[1]] = "X"
        @curr_pos = [(pos[0] - 1), pos[1]]
        true
    end

    def move_right
        if self.maze_matrix[@curr_pos[0]][@curr_pos[1] + 1] == "*" || @visited.include?([curr_pos[0], curr_pos[1] + 1])
            return false
        end
        pos = self.curr_pos
        self.visited.push(pos)
        self.maze_matrix[pos[0]][pos[1]] = "X"
        @curr_pos = [pos[0], (pos[1] + 1)] 
        true
    end

    def move_down
        if self.maze_matrix[@curr_pos[0] + 1][@curr_pos[1]] == "*" || @visited.include?([curr_pos[0] + 1, curr_pos[1]])
            return false
        end
        pos = self.curr_pos
        self.visited.push(pos)
        self.maze_matrix[pos[0]][pos[1]] = "X"
        @curr_pos = [(pos[0] + 1), pos[1]]
        true
    end

    def move_left
        if self.maze_matrix[@curr_pos[0]][@curr_pos[1] - 1] == "*" || @visited.include?([curr_pos[0], curr_pos[1] - 1])
            return false
        end
        pos = self.curr_pos
        self.visited.push(pos)
        self.maze_matrix[pos[0]][pos[1]] = "X"
        @curr_pos = [pos[0], (pos[1] - 1)]
        true
    end

    def find_position(symbol)
        position = []
        self.maze_matrix.each_with_index do |row, idx1|
           row.each_with_index do |col, idx2|
                if col == symbol
                    position << idx1
                    position << idx2
                end
           end
        end
        position
    end

    def print_maze
        p self.maze_matrix[0]
        p self.maze_matrix[1]
        p self.maze_matrix[2]
        p self.maze_matrix[3]
        p self.maze_matrix[4]
        p self.maze_matrix[5]
        p self.maze_matrix[6]
        p self.maze_matrix[7]
    end

    def find_path
       if @curr_pos == @end_pos
        puts "Solution Found!"
        self.print_maze
        return true
       end

       if self.move_up == true
            self.find_path
       elsif self.move_right == true
            self.find_path
       elsif self.move_down == true
            self.find_path
       elsif self.move_left == true
            self.find_path
       else
        puts "The maze has no exit"
       end
    end
end



my_maze = Maze.new

my_maze.find_path






