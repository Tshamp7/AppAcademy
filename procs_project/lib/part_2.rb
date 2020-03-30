require "byebug"


def reverser(str, &prc)
 new_str = ""

  i = str.length - 1

  while i >= 0
   new_str << str[i]
   i -= 1
  end


 return proc.call(new_str)

end

def word_changer(str, &prc)

 str_arr = str.split(" ")
 new_arr = []

 str_arr.each do |word|
  new_arr << proc.call(word)

 end

  new_arr.join(" ")
end

def greater_proc_value(num, prc1, prc2)
 result_1 = prc1.call(num)
 result_2 = prc2.call(num)

 if result_1 > result_2
    return result_1
 else
    return result_2
 end
end

def and_selector(arr, prc1, prc2)
 true_arr = []
 
 arr.each do |ele|
  if prc1.call(ele) == true && prc2.call(ele) == true
    true_arr << ele
  end
 end


 true_arr
end


def alternating_mapper(arr, prc1, prc2)
 new_arr = []
  
  (0..arr.length - 1).each do |i|
    if i.even? == true
        new_arr << prc1.call(arr[i])
    elsif i.odd? == true
      new_arr << prc2.call(arr[i])  
    end
  end


 new_arr
end