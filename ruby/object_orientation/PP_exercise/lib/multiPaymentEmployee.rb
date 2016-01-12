
class MultiPaymentEmployee < Employee
    def initialize(name, email, year_salary, hourly_rate, hours_worked)
        @name = name
        @email = email
        @year_salary = year_salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_weekly_salary
    	weekly_salary = @year_salary / 52

    	if (@hours_worked > 40)
      		weekly_salary += ((@hours_worked - 40) * @hourly_rate)
      	end

      	weekly_salary * 1.18
    end
end