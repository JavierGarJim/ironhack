
class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_weekly_salary
      #returns the hours worked * hourly_rate
      @hourly_rate * @hourly_rate * 1.18
    end
end