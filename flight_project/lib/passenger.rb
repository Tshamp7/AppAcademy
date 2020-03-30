class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_num)
        up_case = flight_num.upcase

        if @flight_numbers.include?(up_case)
            return true
        else
            return false
        end
    end

    def add_flight(flight_num)
        if !self.has_flight?(flight_num)
            @flight_numbers << flight_num.upcase
        end
    end

end