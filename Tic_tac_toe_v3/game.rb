

class Game
    require "./board"
    require "./human_player"
    require "./computer_player"
    attr_reader :current_player, :board



    def initialize(grid_size, players)
        @players = []
        players.each_pair do |k, v|
            if v == true
                @players << Computer_player.new(k)
            elsif v == false
                @players << Human_player.new(k)
            end
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
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
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