
require_relative("lib/employee.rb")
require_relative("lib/multiPaymentEmployee.rb")
require_relative("lib/hourlyEmployee.rb")
require_relative("lib/salariedEmployee.rb")
require_relative("lib/payroll.rb")


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 30, 30)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 30)

puts josh.calculate_weekly_salary
puts nizar.calculate_weekly_salary
puts ted.calculate_weekly_salary

employees = [ josh, nizar, ted ]

payroll = Payroll.new(employees)

payroll.pay_employees