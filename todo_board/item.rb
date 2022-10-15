class Item
    def self.valid_date?(date_string)
        dates = date_string.split("-").map(&:to_i)
        year, month, day = dates
        return false if dates.length != 3
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
        true
    end

    attr_accessor :title, :deadline, :description
    def initialize(title, deadline, description)
        raise 'wrong dates bro' if !Item.valid_date?(deadline)
        @title, @deadline, @description = title, deadline, description
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        raise "bro wrong dates lol" if !Item.valid_date?(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        end
    end

    def description=(new_description)
        @description = new_description
    end

end
