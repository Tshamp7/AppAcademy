def is_prime?(num)
    if num < 2
        return false
    end


    (2...num).each do |ele|
        if num % ele == 0
            return false
        end

    end

    return true
end



def nth_prime(n)
    output = []
     cur_num = 2
     while output.length - 1 < n
        if is_prime?(cur_num)
            output << cur_num
            cur_num += 1
        else
            cur_num += 1
        end
     end
    output[n - 1]
end

def is_prime?(n)
    if n < 2
        return false
    end

    (2...n).each do |num|
        if n % num == 0
            return false
        end
    end
    return true
end

def prime_range(min, max)
 output = []
  cur_num = min
   while cur_num >= min && cur_num <= max
        if is_prime?(cur_num)
            output << cur_num
            cur_num += 1
        else 
            cur_num += 1 
        end
   end
 output
end

def element_count(arr)
    counts = Hash.new(0)

    arr.each do |ele|
        counts[ele] += 1
    end
 counts
end

def char_replace!(str, hash)
    str.each_char.with_index do |letter, i|
        hash.each do |k, v|
            if letter == k
                str[i] = v
            end
        end
    end
 str
end


def product_inject(arr)
    arr.inject { |acc, el| acc * el }
end