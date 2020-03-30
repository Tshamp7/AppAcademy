require './item'


class List
    attr_accessor :label, :items

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = nil)
        @items << Item.new(title, deadline, description)
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        @items.each_index do |i|
           if i == idx
            return true
           end 
        end
        return false
    end

    def swap_index(idx_1, idx_2)
        if !self.valid_index?(idx_1.to_i) || !self.valid_index?(idx_2.to_i)
            puts "That is not a valid index!"
            return false
        else
            @items[idx_1.to_i], @items[idx_2.to_i] = @items[idx_2.to_i], @items[idx_1.to_i]
            return true
        end
    end

    def [](idx)
        if self.valid_index?(idx)
            return @items[idx]
        else
            return nil
        end
    end

    def priority
        puts "------------------------------------------"
        puts "#{@items[0].title.ljust(20)} #{@items[0].deadline}"
        puts "#{@items[0].description.ljust(20)}" "done?:" "#{@items[0].done}"
        puts "------------------------------------------"
    end

    def print
        puts "----------------------------------------------------------------------"
        puts "                            #{self.label}                             "
        puts "----------------------------------------------------------------------"
        self.items.each_with_index do |item, i|
            puts "#{i.to_s.ljust(10)}| #{item.title.ljust(15)} | #{item.deadline.ljust(10)} | #{item.description} | done?: #{item.done}"
        end
        puts "----------------------------------------------------------------------"
    end

    def print_full_item(index)
        idx = index.to_i
        if self.valid_index?(idx)
            puts "------------------------------------------"
            puts "#{@items[idx].title.ljust(20)} #{@items[idx].deadline}"
            puts "#{@items[idx].description.ljust(20)}" "done?: #{@items[idx].done}"
            puts "------------------------------------------"
        end
    end

    def up(index, amount = 1)
        count = amount.to_i
        current_idx = index.to_i

        while count > 0
            if index.to_i != 0 && self.valid_index?(index.to_i)
                @items[current_idx], @items[current_idx - 1] = @items[current_idx - 1], @items[current_idx]
                count -= 1 
                current_idx -= 1
                return true
            elsif !self.valid_index?(index.to_i)
                puts "Invalid index #{index.to_i}"
                return false
            end
            count -= 1
        end
    end

    def down(index, amount = 1)
        count = amount.to_i
        current_idx = index.to_i
        while count > 0
            if @items[current_idx] != @items[-1] && self.valid_index?(index.to_i)
                @items[current_idx + 1], @items[current_idx] = @items[current_idx], @items[current_idx + 1]
                count -= 1
                current_idx += 1
                return true
            elsif !self.valid_index?(index.to_i)
                puts "Invalid index #{index.to_i}"
                return false
            end
            count -= 1
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        idx = index.to_i

        if @items[idx].done == true
            @items[idx].done = false    
        else
            @items[idx].done = true
        end
    end

    def remove_item(index)
        @items.delete_at(index)
    end

    def purge
        @items.clear()
    end





end

#my_list = List.new("house chores")
#
#my_list.add_item("clean windows", "2020-03-21", "Fuck yeah!")
#my_list.add_item("feed cat", "2020-03-22", "Fuck yeah!")
#my_list.add_item("pickup dog poop", "2020-03-22", "Fuck yeah!")
#my_list.add_item("feed dad", "2020-03-23", "Fuck yeah!")
#my_list.add_item("fix brakes", "2020-03-24", "Fuck yeah!")
#my_list.add_item("paint fence", "2020-03-25", "Fuck yeah!")
#
#my_list.print
#
#my_list.down("0", "1")
#
#my_list.print
#
#my_list.up("1", "1")
#
#my_list.print_full_item(1)
#
#my_list.toggle_item(0)
#
#my_list.print
#
#my_list.remove_item(0)
#
#my_list.print
#
#my_list.print_full_item(2)
