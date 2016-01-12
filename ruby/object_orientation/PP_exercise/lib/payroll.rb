
class Payroll
    def initialize(employees)
        @employees = employees
    end

    def notify_employee(employee)
    	puts "#{employee.name} was paid!"
    	puts "Sending email to #{employee.email}..."
    end

  	def pay_employees
      	# Should output how much we're paying each employee for this week and the total amount spent on payroll this week.
		total_salary = 0

      	@employees.each {
      		| employee |
      		puts "Employee #{employee.name}:\t\t#{employee.calculate_weekly_salary}"
      		notify_employee(employee)
      		total_salary += employee.calculate_weekly_salary
      	}

     	puts "Total:\t\t\t#{total_salary}"
  	end
end