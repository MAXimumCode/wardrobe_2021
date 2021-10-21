require_relative 'wear'

class Wardrobe
  attr_reader :clothes

  def self.add_from_txt(array_of_path)
    clothes_array = array_of_path.map do |file_path|
      item = File.new(file_path).readlines
      temp_array = item[2].delete('()').split.map(&:to_i)

      Wear.new(
        cloth_name: item[0].chomp,
        cloth_type: item[1].chomp,
        temp_range: temp_array[0]..temp_array[1]
      )
    end
    new(clothes_array)
  end

  def initialize(clothes)
    @clothes = clothes
  end

  def make_range(temp)
    Range.new(temp.delete('()').split.map(&:to_i))
  end

  def types_of_clothing
    clothes.map(&:cloth_type).uniq
  end

  def clothes_of_one_type(type)
    clothes.select { |clothing| clothing.cloth_type == type }
  end

  def by_type_and_temperature(type, temperature)
    clothes_of_one_type(type).select do |clothing|
      clothing.match_weather?(temperature)
    end
  end

  def clothes_picker(users_temperature)
    types_of_clothing.filter_map do |type|
      by_type_and_temperature(type, users_temperature).sample
    end
  end
end
