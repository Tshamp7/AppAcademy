class Board
    attr_reader :size

  def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
  end



  def initialize(n)
      @grid = Array.new(n) { Array.new(n, :N) }
      @size = n * n
  end

  def [](arr)
       return @grid[arr[0]][arr[1]]
  end

  def []=(position, value)
       @grid[position[0]][position[1]] = value
  end

  def num_ships
      @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  
    def place_random_ships
      max_ships = 0.25 * self.size
     
        while self.num_ships < max_ships
          position = [rand(0...@grid.length),rand(0...@grid.length)]
          self[position] = :S
        end
    end

 def hidden_ships_grid
     @grid.map do |row|
          row.map do |ele|
              if ele == :S
                  ele = :N
              else
                  ele                
              end
          end
      end
 end

 def cheat
      Board.print_grid(@grid)
 end

 def print
      Board.print_grid(hidden_ships_grid)
 end










end
