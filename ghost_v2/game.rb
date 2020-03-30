require_relative "player"
require_relative "ai_player"
require "byebug"

class Game
    attr_reader :players, :dictionary, :fragment, :current_player, :previous_player
    attr_writer :fragment, :current_player, :previous_player

    def initialize(*player_names)
        @players = []
        player_names.each do |name|
            if name == true
                players << Ai_player.new(rand(100))
            else
                players << Player.new(name)
            end 
        end
        @fragment = ""
        @current_player = players[0]
        @previous_player = players[-1]
        @dictionary = Hash.new(0)
        File.open('dictionary.txt', 'r') do |file|
            file.each_line do |word|
                @dictionary[word.chomp] += 1
            end
        end
    end

    def valid_choice?(letter)
       alpha = "abcdefghijklmnopqrstuvwxyz"
       if alpha.include?(letter) || alpha.include?(letter.upcase)
            return true
       else
            return false
       end
    end

    def valid_fragment?(letter)
        check_frag = self.fragment + letter

        @dictionary.each_key do |key|
            if key.start_with?(check_frag)
                return true
            end
        end
        return false
    end


    def swap_player
        self.players.rotate!(1)
        self.current_player = players[0]
        self.previous_player = players[-1]
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

    def display_standings
        self.players.each do |player|
            puts "#{player.name} currently has #{player.letters.length} letters towards becoming the GHOST."
            puts "-------------"
        end
    end

    def find_winning_move
        winning_moves = []
        @dictionary.each_key do |word|
            if word.start_with?(@fragment) && ((word.length - @fragment.length) < self.players.length)
                winning_moves << word
            end
        end

        rand_word_idx = rand((winning_moves.length - 1))

        chosen_word = winning_moves[rand_word_idx]

        letter_idx = @fragment.length
        puts "Player #{self.current_player.name} has chosen #{chosen_word[letter_idx]}."
        return chosen_word[letter_idx]
    end

    def play_round
        ghost = false
        
    

        while !ghost
            
            round_complete = false
            display_standings
            while !round_complete

                valid = false

                while !valid
                    if self.current_player.ai == true
                        letter = self.find_winning_move
                    else
                        puts "#{self.current_player.name}, please enter an alphabetic character to add to the word fragment."
                        letter = gets.chomp
                    end

                    if self.valid_choice?(letter)
                        if self.valid_fragment?(letter)
                            self.fragment += letter
                            puts "The fragment is now #{self.fragment}"
                            self.swap_player
                            valid = true
                        else
                            puts "This game is a draw! There are no words that start with the fragment #{self.fragment + letter}."
                            self.fragment = ""
                            round_complete = true
                            
                        end
                    else
                        puts "That is not a valid entry."
                    end
                end

                if round_over?
                    puts "#{self.previous_player.name} has lost! #{@fragment} was spelled!"
                    
                    self.current_player.wins += 1
                    self.fragment = ""
                    if self.previous_player.assign_letter == true
                        puts "#{self.previous_player.name} has become the GHOST!"
                        ghost = true
                    end
                    puts "#{self.previous_player.name}'s letters now spell #{@previous_player.letters}"
                    round_complete = true
                end

                



            end

        end
    end

end


my_game = Game.new("Tom", "Amber", "kai")

my_game.play_round

