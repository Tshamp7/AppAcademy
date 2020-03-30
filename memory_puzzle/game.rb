require_relative 'board'
require_relative 'card'
require_relative 'human_player'
require_relative 'ai_player'
require 'byebug'


class Game
 attr_accessor :board, :previous_guess, :player
 attr_reader :player
    def initialize(des_grid_size, player)
        @board = Board.new(des_grid_size)
        @previous_guess = nil
        @player = nil
        if player == true
            @player = Ai_player.new("T-#{rand(1000)}")
        else
            @player = Human_player.new(player)
        end
    end

    def play
        self.board.populate
        while self.board.won? != true
            system("clear")
            self.board.render
            guess_one = self.player.get_input
                returned_card1 = @board.reveal(guess_one)
            @previous_guess = guess_one
            self.player.receive_card(returned_card1.face_value, guess_one)
            sleep(2)
            system("clear")

            guess_two = self.player.get_input
                returned_card2 = @board.reveal(guess_two)
            self.player.receive_card(returned_card2.face_value, guess_two)
            sleep(2)

            if returned_card1.face_value != returned_card2.face_value
                p "Those don't match! Please try again!"
                sleep(2)
                returned_card1.face_up = false
                returned_card2.face_up = false
                system("clear")
            elsif returned_card1.face_value == returned_card2.face_value
                p "Nice match!"
                sleep(2)
                self.player.return_match(guess_one, guess_two)
            end
        end
    end

end