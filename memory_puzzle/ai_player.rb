require_relative 'game'
require_relative 'board'
require_relative 'game'
require "byebug"

class Ai_player
    attr_accessor :positions, :known_cards, :matched_pairs, :matched_on_board, :turn
    attr_reader :name, :ai
    def initialize(name)
        @name = name
        @ai = true
        @turn = 0
        @positions = [[0,0], [0,1], [0,2], [0,3], [1,0], [1,1], [1,2], [1,3], [2,0], [2,1], [2,2], [2,3], [3,0], [3,1], [3,2], [3,3]]
        @known_cards = {}
        @matched_on_board = []
        @matched_pairs = []
    end

    def get_input
        system("clear")
        @turn += 1
       if @matched_pairs.empty?
            output = @positions[0]
            @positions.delete(output)
       elsif @matched_pairs.length.even? && turn.odd? || @matched_pairs.length.odd? && turn.even?
            output = @matched_pairs[0]
            @matched_pairs.delete(output)
            @known_cards.delete(output)
       else
            output = @positions[0]
            @positions.delete(output)
       end

       if @matched_pairs.length == 0
        self.add_matches
       end

       output = self.output_to_string(output)
       puts "The computer has chosen #{output} this turn. "
       return output
    end

    def output_to_string(arr)
        if arr.is_a?(Array)
        output = arr[0].to_s + " " + arr[1].to_s
        return output
        else
            return arr
        end
    end



    def add_matches
        @known_cards.each_pair do |position, face_value|
            @known_cards.each_pair do |position2, face_value2|
                if face_value == face_value2 && position != position2
                    if !@matched_on_board.include?(position) || !@matched_on_board.include?(position2) 
                        @matched_pairs << position if !matched_pairs.include?(position)
                        @matched_pairs << position2 if !matched_pairs.include?(position2)
                    end
                end
             end
        end

    end

    def return_match(guess_one, guess_two)
        @matched_on_board << guess_one
        @matched_on_board << guess_two
    end
  


    def receive_card(card_value, position)
        @known_cards[position] = card_value if !@matched_on_board.include?(position)
    end



end