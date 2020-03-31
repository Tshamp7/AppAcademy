class Square
    attr_reader :flag, :mine, :revealed
    attr_writer :mine
    def initialize(value)
        @mine = value || false
        @flag = false
        @revealed = false
    end

    def flag(pos)
        if flag == false
            @flag = true
        else
            flag = false
        end
    end

    def mine?
        @mine
    end

    def flag?
        @flag
    end

    def revealed?
        @revealed
    end
end