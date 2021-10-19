require_relative 'lib/wardrobe'

puts "Программа 'Выбор одежды по погоде'"
puts

files_path = "#{File.dirname(__FILE__)}/data/"

begin
  clothes_directory = Dir.glob("#{files_path}*.txt")
rescue SystemCallError
  abort 'Папка с одеждой не найдена'
end

abort "Файлы с одеждой не найдеты в директории #{files_path}" if clothes_directory.empty?

wardrobe = Wardrobe.new
wardrobe.add_from_txt(clothes_directory)

puts 'Сколько градусов за окном? (можно с минусом)'
puts

user_temperature = wardrobe.random_suit_for_weather(gets.to_i)

puts 'Предлагаем сегодня надеть:'
puts

if user_temperature == :out_of_range
  puts 'К сожалению не нашлось подходящей одежды'
else
  puts wardrobe.pick_clothes
end
