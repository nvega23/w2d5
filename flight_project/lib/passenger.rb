class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        @name
    end

    def has_flight?(str)
        @flight_numbers.include?(str.downcase) || @flight_numbers.include?(str.upcase)
    end

    def add_flight(flight_number)
        if !self.has_flight?(flight_number)
            @flight_numbers << flight_number.upcase
        end
    end

end
