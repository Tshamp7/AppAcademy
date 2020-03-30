def range(start, finish)  #recursion
    return [] if finish < start
    range(start, finish - 1) << finish
end

def iter_range(start, finish) #iterative range
    output = []
    i = start
    while i < finish
        output << i
        i += 1
    end
    output
end

def exponentiation(base, exp) #recursive exponent #1
    return base if exp == 1
    base * exponentiation(base, exp - 1)
end

def exponentiation2(base, exp) #recursive exponent #2
    return 0 if exp == 0 
    return base if exp == 1

    if base.even?
        exponentiation2(base, exp / 2) ** 2
    elsif base.odd?
        base * (exp(b, (n - 1) / 2 ) ** 2)
    end
end

class Array
  
    def deep_dup
      new_array = []
      self.each do |el|
        new_array << (el.is_a?(Array) ? el.deep_dup : el)
      end
      new_array
    end
  
end

def fibonacci(n)   #recursive
   return [0] if n == 0
   return [0, 1] if n == 1

   fibs = fibonacci(n - 1)
   fibs << fibs[-2] + fibs[-1]
end

def iter_fib(n)
    output = [1, 1, 2]
        while output.length < n
            next_ele = output[-1] + output[-2]
            output << next_ele
        end
    output
end

def bsearch(nums, target)
    # nil if not found; can't find anything in an empty array
    return nil if nums.empty?
  
    probe_index = nums.length / 2
    case target <=> nums[probe_index]
    when -1
      # search in left
      bsearch(nums.take(probe_index), target)
    when 0
      probe_index # found it!
    when 1
      # search in the right; don't forget that the right subarray starts
      # at `probe_index + 1`, so we need to offset by that amount.
      sub_answer = bsearch(nums.drop(probe_index + 1), target)
      sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
    end
  
    # Note that the array size is always decreasing through each
    # recursive call, so we'll either find the item, or eventually end
    # up with an empty array.
end

class Array
    def merge_sort
      return self if count < 2
  
      middle = count / 2
  
      left, right = self.take(middle), self.drop(middle)
      sorted_left, sorted_right = left.merge_sort, right.merge_sort
  
      merge(sorted_left, sorted_right)
    end
  
    def merge(left, right)
      merged_array = []
      until left.empty? || right.empty?
        merged_array << (left.first < right.first) ? left.shift : right.shift
      end
  
      merged_array + left + right
    end
end

def subsets(arr)
    return [[]] if arr.empty?
    old_subsets = subsets(arr.drop(1))
    new_subsets = []
    old_subsets.each do |subset|
        new_subsets << subset + [arr.first]
    end
    old_subsets + new_subsets
end

def permutations(arr) #nonrecursive
    output = [] 
    while output.length != factorial(arr.length)
        input = arr.shuffle
        output << input if !output.include?(input)
    end
    output
end

def factorial(n)
    return 1 if n == 1
    n * factorial(n - 1)
end



def make_change(target, coins = [25, 10, 5, 1])
    return [] if target == 0
    return nil if coins.none? { |coin| coin <= target }

    coins = coins.reverse

    best_change = nil

    coins.each_with_index do |coin, index|
        next if coin > target

        remainder = target - coin

        best_remainder = make_change(remainder, coins.drop(index))

        next if best_remainder.nil?
        
        this_change = [coin] + best_remainder

        if best_change.nil? || (this_change.count < best_change.count)
            best_change = this_change
        end
    end
    best_change
end






