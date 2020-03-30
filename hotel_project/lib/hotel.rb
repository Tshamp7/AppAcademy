require_relative "room"

class Hotel
  def initialize(name, hash)
   @name = name
   @rooms = {}
   hash.each_pair do |k, v|
    @rooms[k] = Room.new(v)
   end
  end


 def name
  new_arr = [] 
  @name.split(" ").each do |word|
   new_arr << word.capitalize
  end
  new_arr.join(" ")
 end

 def rooms
  @rooms
 end

 def room_exists?(str)
  if @rooms.include?(str)
    true
  else
    false
  end
 end

 def check_in(person, room_name)
   if !self.room_exists?(room_name)
     print "sorry, room does not exist"
   else
    if @rooms[room_name].add_occupant(person)
      print "check in successful"
    else
      print "sorry, room is full"
    end
   end

  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each do |name, room|
      puts "#{name} : #{room.available_space}"
    end

  end







 end
 
 







end
