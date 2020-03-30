require "byebug"

class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end
 
  def name
    @name
  end

  def slogan
   @slogan
  end

  def teachers
   @teachers
  end

  def students
   @students
  end
  
 def hire(str)
  @teachers << str
 end
 
 def enroll(str)
   if @students.length < @student_capacity
    @students << str
    return true
   end
   return false
 end

 def enrolled?(str)
  if @students.include?(str)
    return true
  else
    return false
  end

 

 end

 def student_to_teacher_ratio
    @students.length / @teachers.length
 end
 
 def add_grade(str, grd)
   
  if self.enrolled?(str)
    @grades[str] << grd
    return true
  else
    return false
  end
 end
    
 def num_grades(str)
  @grades[str].length
 end

 def average_grade(str)

 @grades[str].sum / self.num_grades(str)
 rescue
    return nil
 end
 
end


