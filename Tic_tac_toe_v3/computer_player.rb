class Computer_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        rand_idx = rand(legal_positions.length - 1)
        pos = legal_positions[rand_idx]

        puts "The computers mark is #{self.mark}. The chosen position for this turn is #{pos}"

        return pos
    end

    













end