def zip(*arrays)
    length = arrays.first.length

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(arr, prc1, prc2)
    output = []

    arr.each do |ele|
        if (prc1.call(ele) == true && prc2.call(ele) == false) || (prc1.call(ele) == false && prc2.call(ele) == true)
            output << ele
        end
    end
    output
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def maximum(arr, &prc)
    return nil if arr.length == 0

    max = arr[0]
    arr.each do |ele|
        if prc.call(ele) >= prc.call(max)
            max = ele
        end
    end
    max
end

def my_group_by(arr, &prc)
    output = Hash.new([])

    arr.each do |ele|
        output[prc.call(ele)] = []
    end

    output.each do |k, v|
       arr.each do |ele|
            if prc.call(ele) == k
                output[k] << ele
            end
       end
    end
    output
end



def max_tie_breaker(arr, block, &prc)
    return nil if arr.length == 0

    max = arr[0]
    arr.each do |ele|
        if prc.call(ele) > prc.call(max)
            max = ele
        end
    end
    max
end

def silly_syllables(sentence)
    sent_arr = sentence.split(" ")
    output = []

    sent_arr.each do |word|
        idx_arr = vowel_indices(word)
        if idx_arr.length < 2
            output << word
        else
            output << word[idx_arr[0]..idx_arr[-1]]
        end
    end
 output.join(" ")
end

def vowel_indices(word)
 vowels = "aeiou"
   idx_arr = [] 
    word.each_char.with_index do |letter, i|
        if vowels.include?(letter)
            idx_arr << i
        end
    end
 idx_arr
end















































































