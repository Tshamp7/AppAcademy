def proper_factors(n)
    output = []
    (1...n).each do |num|
        if n % num == 0
            output << num
        end
    end
 output
end


def aliquot_sum(n)
    proper_factors(n).sum
end


def perfect_number?(n)
    if n == aliquot_sum(n)
        true
    else
        false
    end
end

def ideal_numbers(n)
    output = []
    cur_num = 1
    while output.length < n
        if perfect_number?(cur_num)
            output << cur_num
            cur_num += 1
        else
            cur_num += 1
        end

        output
    end
    output
end