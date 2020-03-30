def my_reject(arr, &prc)
    output = []
    arr.each do |ele|
        if !prc.call(ele)
            output << ele
        end
    end
    output
end


def my_one?(arr, &prc)
    count = 0

    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end

    if count != 1
        return false
    else 
        return true
    end
end

def hash_select(hash, &prc)
    output = {}

        hash.each do |k1, v1|
            if prc.call(k1, v1)
                output[k1] = v1
            end
        end
    output
end


def xor_select(arr, prc1, prc2)
    output = []
    arr.each do |ele|
        if prc1.call(ele) && prc2.call(ele)

        elsif prc1.call(ele) || prc2.call(ele)
            output << ele
        end
    end
    output
end

def proc_count(val, arr)
    count_true = 0

    arr.each do |proc|
        if proc.call(val)
            count_true += 1
        end
    end
    count_true
end

