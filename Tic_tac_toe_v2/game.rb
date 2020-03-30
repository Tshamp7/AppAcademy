

class Game
    require "./board"
    require "./human_player"
    attr_reader :board



    def initialize(grid_size, *players_marks)
        @players = []
        players_marks.each do |mark|
            @players << Human_player.new(mark)
        end
        @board = Board.new(grid_size)
        @current_player = @players[0]
    end

    def switch_turn
       @players = @players.rotate
       @current_player = @players[0]
    end

    def play
        while @board.empty_positions? == true
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Congratulations! Player #{@current_player.mark} has won the game!"
                return
            else
                self.switch_turn
            end
        end
        puts "The game has ended in a draw!"
    end











end