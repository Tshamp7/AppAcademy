require "employee"

class Startup
attr_reader(:name, :funding, :salaries, :employees)

 def initialize(name, funding, salaries)
  @name = name
  @funding = funding
  @salaries = salaries
  @employees = []
 end

 def valid_title?(title)
  if @salaries.include?(title)
    true    
  else
    false
  end
 end

 def >(startup)
  if self.funding > startup.funding
    true
  else
    false
  end
 end

 def hire(employee_name, title)
  if self.salaries.include?(title)
    @employees << Employee.new(employee_name, title)
  else
    return exception
  end
 end

 def size
    @employees.length
 end

 def pay_employee(employee)
   if self.funding > self.salaries[employee.title]
     employee.pay(self.salaries[employee.title])
     @funding -= self.salaries[employee.title]
   else
     exception
   end
 end


 def payday
  @employees.each { |employee| pay_employee(employee) }
 end

 def average_salary
    total_pay = 0
    @employees.each do |employee|
        total_pay += @salaries[employee.title]
    end
    total_pay / @employees.length
 end

 def close
  @employees = []
  @funding = 0
 end

 def acquire(startup)
    @funding += startup.funding
    @salaries = startup.salaries.merge(@salaries)
    startup.employees.each { |employee| self.employees << employee }
    startup.close
 end
end


