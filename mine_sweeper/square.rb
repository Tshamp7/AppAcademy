class Square
    attr_reader :flag, :bomb, :revealed
    def initialize(value)
        @bomb = value || false
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

    def bomb?
        @bomb
    end

    def flag?
        @flag
    end

    def revealed?
        @revealed
    end
end