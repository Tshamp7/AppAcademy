

class Game
    require "./board"
    require "./human_player"
attr_reader :player_1, :player_2, :board



    def initialize(player_1_mark, player_2_mark)
        @player_1 = Human_player.new(player_1_mark)
        @player_2 = Human_player.new(player_2_mark)
        @board = Board.new
        @current_player = player_1
    end

    def switch_turn
        if @current_player == player_1
            @current_player = player_2
        else
            @current_player = player_1
        end
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