class Square
    attr_accessor :mine, :value
    def initialize(value)
        @mine = value || false
        @value = "*"
    end

    def flag
        if @value == "*"
            @value = "F"
        else
            @value = "*"
        end
    end

    def reveal_blank
        if @value == "*" && @mine == false
            @value = "_"
        end
    end

    def mine?
        @mine
    end
end