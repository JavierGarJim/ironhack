
class SalariedEmployee < Employee
    def initialize(name, email, year_salary)
        @name = name
        @email = email
        @year_salary = year_salary
    end

    def calculate_weekly_salary
      	(@year_salary / 52) * 1.18
    end
end