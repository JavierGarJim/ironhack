
require_relative('user.rb')
require_relative('program.rb')

new_username = "nizar"
new_password = "swordfish"

program = Program.new
program.add_user(User.new(new_username, new_password))

puts "Username:"
username = gets.chomp

puts "Password:"
password = gets.chomp

puts "-----"

program.run(username, password)

