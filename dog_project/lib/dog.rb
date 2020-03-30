class Dog
 def initialize(name, breed, age, bark, food_arr)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = food_arr
 end
 
 def name
  @name
 end

 def breed
  @breed
 end

 def age
  @age
 end

 def age=(num)
 @age = num
 end
 
 def bark
   if @age > 3
    return @bark.upcase
   elsif @age <= 3
    return @bark.downcase
   end
 end

 def favorite_foods
  @favorite_foods
 end

 def favorite_food?(str)

  @favorite_foods.each do |item|
     if str.downcase == item.downcase
        return true
     end
    end
    return false
 end

end

