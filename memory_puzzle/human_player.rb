require_relative 'game'
require_relative 'board'

class Human_player
    attr_accessor :name
    attr_reader :ai
    def initialize(name)
        @name = name
        @ai = false
    end

    def get_input
        puts "Player #{self.name}, enter the space you would like to reveal in the format row col."
        input = gets.chomp
        system("clear")
        return input
    end

    def receive_card(card_value, position)
        puts "The card at position #{position} is a #{card_value}"
    end

    def return_match(guess_one, guess_two)
        "Your guesses this turn were #{guess_one} and #{guess_two}."
    end

end