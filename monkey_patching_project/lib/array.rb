# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span

   if self[0] != nil
   self.max - self.min
   else
    return nil
   end
  end
 
  def average
    if self[0] != nil
      self.sum/self.length.to_f
    else
       return nil
    end
  end

  def median
    if self[0] != nil
        if self.length.odd?
            return self.sort[self.length.to_f / 2]
        elsif self.length.even?
          return (self.sort[self.length.to_f / 2 - 1] + self.sort[self.length.to_f / 2.to_f]) / 2.to_f
        end
    else
        return nil
    end
 end
 
 def counts
   counts = Hash.new(0)
    self.each { |ele| counts[ele] += 1 }
   return counts
 end

 def my_count(value)
   count = 0
 self.each do |ele|
   if ele == value
    count += 1
   end
  end
   return count
 end

 def my_index(value)
  self.each_with_index do |ele, i|
    if ele == value
        return i
    end
  end
 return nil
 end
 
 def my_uniq
  new_arr = []
      self.each do |ele|
       if !new_arr.include?(ele) 
        new_arr << ele
       end
      end
  return new_arr
 end

 def my_transpose
  new_arr = []
  
  (0...self.length).each do |row|
    new_row = []
    (0...self.length).each do |col|
     new_row << self[col][row]
     
    end
    new_arr << new_row
  end


    new_arr
 end



end
