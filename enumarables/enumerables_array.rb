require "byebug"
class Array

    def my_each(&prc)
        current_index = 0
        while current_index < self.length
            prc.call(self[current_index])
            current_index += 1
        end
        return self
    end

    def my_select(&prc)
        output = []
        self.my_each do |ele|
            if prc.call(ele)
                output << ele
            end
        end
        output
    end

    def my_reject(&prc)
        output = []
        self.my_each do |ele|
            if !prc.call(ele)
                output << ele
            end
        end
        output
    end

    def my_any(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        return false
    end
    
    def my_all?(&prc)
        self.my_each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        return true
    end

    def my_flatten(results = [])
        self.each do |ele|
            if ele.class == Array
                ele.my_flatten(results)
            else
                results << ele
            end
        end
        results
    end

    def my_zip(*args)
        output = []
        self.each_with_index do |ele, i|
            sub_arr = []
           args.each_with_index do |arr, idx2|
            if arr[i] != nil
                sub_arr << self[i] if !sub_arr.include?(self[i]) 
                sub_arr << arr[i]
            else
                sub_arr << self[i] if !sub_arr.include?(self[i])
                sub_arr << nil
            end
           end
           output << sub_arr
        end
        output
    end

    def my_rotate(num)
        count = num
        new_arr = self
        while count != 0
            if count > 0
                first_char = new_arr[0]
                rest = new_arr[1..-1]
                new_arr = rest << first_char
                count -= 1
            elsif count < 0
                last_char = new_arr[-1]
                rest = new_arr[0..-2]
                new_arr = rest.unshift(last_char)
                count += 1
            end
        end
        new_arr
    end

    def my_join(str = "")
        new_str = ""
        self.each do |char|
            new_str += char + str
        end
        new_str
    end

    def my_reverse
        new_arr = []
        curr_idx = self.length - 1
        self.each do |ele|
            if curr_idx >= 0
                new_arr << self[curr_idx]
                curr_idx -= 1
            end
        end
        new_arr
    end

    def bubble_sort!(&prc)
       sorted = false

       while !sorted
            idx = 0
            swaps = 0
            while idx < self.length - 1
                if prc.call(self[idx], self[idx + 1]) == 1
                    self[idx], self[idx + 1] = self[idx + 1], self[idx]
                    swaps += 1 
                end
                idx += 1
            end
            sorted = true if swaps == 0
       end
        self
    end

    def duplicate 
        new_arr = []
        self.each do |ele|
            new_arr << ele
        end
        new_arr
    end

    def bubble_sort(&prc)
        new_arr = self.duplicate
        new_arr.bubble_sort! {|a, b| a <=> b }
        new_arr
    end





end


def factors(num)
    output = []
    (1..num).each do |n|
        if num % n == 0
            output << n
        end
    end
    output
end


def substring(str)
    substrings = []

    str.each_char.with_index do |char, i|
        str.each_char.with_index do |char2, i2|
            if i < i2
                substrings << char + char2 if !substrings.include?(char + char2)
            end
        end
    end
    substrings
end



def subwords(string, dictionary) 
    output = []

    dictionary.each do |word|
        if string.include?(word)
            output << word if !output.include?(word)
        end
    end
    output
end


