def my_map(arr, &prc)
 new_arr = []

 arr.each do |ele|
  new_arr << proc.call(ele)
 end

 new_arr
end

def my_select(arr, &proc)
 new_arr = []
  
 arr.each do |ele|
  if proc.call(ele) == true
    new_arr << ele
   end
 end
 
 
 new_arr
end

def my_count(arr, &prc)
 count = 0
 arr.each do |ele|
    if proc.call(ele) == true
        count += 1
    end
 end

 count
end

def my_any?(arr, &prc)
 output = false

 arr.each do |ele|
  if proc.call(ele) == true
    output = true
  end
 end


 output
end

def my_all?(arr, &prc)
 count_true = 0
  
  arr.each do |ele|
   if proc.call(ele) == true
    count_true += 1
   end
  end
 
  if count_true == arr.length
    return true
  else
    return false
  end
 
end


def my_none?(arr, &prc)

    arr.each do |ele|
     if proc.call(ele) == true
      return false
     end
    end

   return true

end
