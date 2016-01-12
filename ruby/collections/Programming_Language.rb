class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

  ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
  python = ProgrammingLanguage.new("Python", 24, "Dynamic")
  javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
  go = ProgrammingLanguage.new("Go", 6, "Static")
  rust = ProgrammingLanguage.new("Rust", 5, "Static")
  swift = ProgrammingLanguage.new("Swift", 2, "Static")
  java = ProgrammingLanguage.new("Java", 20, "Static")

  array_of_languages = [ruby, python, javascript, go, rust, swift, java]

  def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
end

array_printer(array_of_languages)

puts "---------------"

# aged_languages = array_of_languages.map do | language |
# 	new_language = ProgrammingLanguage.new(language.name, language.age + 1, language.type)
# 	new_language
# end

# puts "The programming languages aged one year are: "
# array_printer(aged_languages)


# sorted_languages = array_of_languages.sort {| x, y | y.age<=>x.age}
# array_printer(sorted_languages)

# deleted_java_array = array_of_languages.delete_if {|language| language.name == "Java"}
# array_printer(deleted_java_array)

# shuffled_array = array_of_languages.shuffle
# array_printer(shuffled_array)

# averaged_age = array_of_languages.reduce(0) {
#   |sum, language| sum + language.age
# }
# puts averaged_age / array_of_languages.length

array_of_languages.map! { | language | language.name + "!!!" 
  language }
array_printer(array_of_languages)

array_of_languages.map { | language | language.name += "!!!" 
  language }
array_printer(array_of_languages)

array_of_languages.map! { | language | 
  new_language = ProgrammingLanguage.new(language.name + "!!!", language.age, language.type)
  new_language
}
array_printer(array_of_languages)





