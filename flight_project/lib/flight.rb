class Flight
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        else
            return false
        end
    end

    def board_passenger(person)
        if !self.full? && person.has_flight?(@flight_number)
            @passengers << person
        end
    end

    def list_passengers
        @passengers.map do |instance|
            instance.name
        end
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(pass)
        self.board_passenger(pass)
    end

end
