require "./item"
require "./list"

class Todo_board
    attr_accessor :list
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, target, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @lists[target] = List.new(target)
            return true
        when 'ls'
            @lists.each_key do |label|
                puts "-------------------------"
                puts label
                puts "-------------------------"
            end 
            return true
        when 'showall'
            @lists.each_value do |list|
                list.print
            end
            return true
        when 'mktodo'
            @lists[target].add_item(*args)
            return true
        when 'up'
            @lists[target].up(*args)
            return true
        when 'down'
            @lists[target].down(*args)
            return true
        when 'swap'
            @lists[target].swap_index(*args)
            return true
        when 'toggle'
            @lists[target].toggle_item(*args)
            return true
        when 'remove'
            @lists[target].remove_item(*args)
            return true
        when 'purge'
            @lists[target].purge
            return true
        when 'sort'
            @lists[target].sort_by_date!
            return true
        when 'priority'
            @lists[target].priority
            return true
        when 'print'
            if args.empty?
                @lists[target].print
                return true
            else
                @lists[target].print_full_item(args[0])
                return true
            end
        when 'quit'
           return false
        else
            print "Sorry, that command is not recognized."
            return true
        end
    end


    def run
        should_run = true

        while self.get_command == true
            self.get_command

            if self.get_command == false
                should_run = false
            end
        end
    end


end


