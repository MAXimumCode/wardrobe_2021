require_relative 'lib/wardrobe'

puts "Программа 'Выбор одежды по погоде'"
puts

files_path = Dir[File.join(__dir__, 'data', '*.txt')]

abort "Файлы с одеждой не найдены в директории #{files_path}" if files_path.empty?

<<<<<<< HEAD
wardrobe = Wardrobe.add_from_txt(files_path)
=======
abort "Файлы с одеждой не найдеты в директории #{files_path}" if clothes_directory.empty?

wardrobe = Wardrobe.add_from_txt(clothes_directory)
>>>>>>> master

puts 'Сколько градусов за окном? (можно с минусом)'
puts

users_temperature = gets.to_i

puts 'Предлагаем сегодня надеть:'
puts

puts wardrobe.clothes_picker(users_temperature)
