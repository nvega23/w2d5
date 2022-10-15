require "./item.rb"

class List


    attr_accessor :label, :title
    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = '')
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        0 <= index && index < self.size
    end

    def swap(idx1, idx2)
        return false if !self.valid_index?(idx1) || !self.valid_index?(idx2)
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        true
    end

    def [](idx)
        return nil if !self.valid_index?(idx)
        if self.valid_index?(idx)
            return @items[idx]
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "--------------------------------"
        puts "------------#{@label}-----------"
        puts "--------------------------------"
        puts "Index | Item            Deadline"
        puts "--------------------------------"
        # puts "#{@items.title}|#{@items.title}|        |#{@deadline}   "
        @items.each.with_index do |item, i|
            puts "#{i}    |#{item.title}         | #{item.deadline}"
        end
    end

    def print_full_item(index)
        puts "-----------------------"
        @items.each do |item|
            puts "#{item.title}                   #{item.deadline}"
            puts "#{item.description}"
        end
        puts "-----------------------"
    end

    def print_priority
        print_full_item[0]
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != 0
            swap(index, index - 1)
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != size - 1
            swap(index, index + 1)
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

end
