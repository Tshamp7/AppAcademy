class Item
    attr_accessor :title, :description, :done
    attr_reader :deadline

   def self.valid_date?(date) ##YYYY-MM-DD
        year = date[0..3].to_i
        month = date[5..6].to_i
        day = date[8..9].to_i
        
        if month < 1 || month > 12
            return false
        end

        if day < 1 || day > 31
            return false
        end

        if date[0..3].include?("-")
            return false
        end
        return true
    end

    def initialize(title, deadline, description)
        @title = title

        deadline_valid = false
        while !deadline_valid
            if Item.valid_date?(deadline)
             @deadline = deadline
             deadline_valid = true
            else
                puts "Your date is not valid, please enter a valid date in the `yyyy-mm-dd` format"
                deadline = gets.chomp
            end
        end
        @description = description 
        @done = false
    end

    def deadline=(new_deadline)
        deadline_valid = false
        while !deadline_valid
            if Item.valid_date?(new_deadline)
             @deadline = new_deadline
             deadline_valid = true
            else
                puts "Your date is not valid, please enter a valid date in the `yyyy-mm-dd` format"
                new_deadline = gets.chomp
            end
        end
    end
end

