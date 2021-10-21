require_relative 'lib/wardrobe'

puts "Программа 'Выбор одежды по погоде'"
puts

array_of_path = Dir[File.join(__dir__, 'data', '*.txt')]

wardrobe = Wardrobe.add_from_txt(array_of_path)

puts 'Сколько градусов за окном? (можно с минусом)'
puts

users_temperature = gets.to_i

puts 'Предлагаем сегодня надеть:'
puts

if wardrobe.clothes_picker(users_temperature).empty?
  puts 'К сожалению не нашлось подходящей одежды'
else
  puts wardrobe.clothes_picker(users_temperature)
end
