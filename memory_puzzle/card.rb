 class Card
    attr_reader :face_value, :face_up
    attr_writer :face_up

    def initialize(value)
        @face_value = (value)
        @face_up = false
    end

    def hide
        if @face_up
            @face_up = false
        end
    end

    def reveal
        if !@face_up
            @face_up = true
        end
    end







end