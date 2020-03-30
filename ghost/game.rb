require_relative "player"
require "byebug"

class Game
    attr_reader :player1, :player2, :dictionary, :fragment, :current_player, :previous_player
    attr_writer :fragment, :current_player, :previous_player
    def initialize(player_1, player_2)
        @player1 = Player.new(player_1)
        @player2 = Player.new(player_2)
        @fragment = ""
        @current_player = @player1
        @previous_player = @player2
        @dictionary = Hash.new(0)
        File.open('dictionary.txt', 'r') do |file|
            file.each_line do |word|
                @dictionary[word.chomp] += 1
            end
        end
    end

    def valid_choice?(letter)
       alpha = "abcdefghijklmnopqrstuvwxyz"
       if (alpha.include?(letter) || alpha.include?(letter.upcase)) && valid_fragment?(letter)
            return true
       else
            return false
       end
    end

    def valid_fragment?(letter)
        check_frag = self.fragment + letter
        @dictionary.each_key do |key|
            if key.include?(check_frag)
                return true
            end
        end
        return false
    end


    def swap_player
        if self.current_player == @player1
            self.current_player = @player2
            self.previous_player = @player1
        else
            self.current_player = @player1
            self.previous_player = @player2
        end
    end

    def round_over?
        @dictionary.each_key do |key|
           return true if key == @fragment
        end
        return false
    end

    def game_over?
        if self.player1.letters == "GHOST" || self.player2.letters == "GHOST"
            return true
        else
            return false
        end
    end

    def play_round
        ghost = false

        while !ghost
            puts "Player #{self.player1.name} has #{self.player1.letters.length} letters towards becoming the GHOST."
            puts "Player #{self.player2.name} has #{self.player2.letters.length} letters towards becoming the GHOST."
            round_complete = false

            while !round_complete

                valid = false

                while !valid
                    puts "#{self.current_player.name}, please enter an alphabetic character to add to the word fragment."
                    letter = gets.chomp
                    if self.valid_choice?(letter)
                        self.fragment += letter
                        puts "The fragment is now #{self.fragment}"
                        self.swap_player
                        valid = true
                    else
                        puts "That is not a valid entry."
                        letter = gets.chomp
                    end
                end

                if round_over?
                    puts "#{self.previous_player.name} has lost! #{@fragment} was spelled!"
                    self.fragment = ""
                    if self.previous_player.assign_letter == true
                        puts "#{self.previous_player.name} has become the GHOST!"
                        ghost = true
                    end
                    puts "#{self.previous_player.name} letters now spell #{self.previous_player.letters}"
                    round_complete = true
                end

                



            end


        end
    end




    













end


my_game = Game.new("Ted", "Tom")
my_game.play_round
