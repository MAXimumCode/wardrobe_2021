require_relative 'wear'

class Wardrobe
  attr_reader :clothes

<<<<<<< HEAD
  def self.add_from_txt(directory)
    clothes_array = directory.map do |file|
      item = File.new(file).readlines
=======
  def initialize
    @clothes = {}
    @pick_clothes = []
  end

  def self.add_from_txt(directory)
    directory.each do |file|
      clothes_array = File.new(file).readlines
>>>>>>> master

      data = {}
      data[:cloth_name] = item[0]
      data[:cloth_type] = item[1]
      data[:temp_range] = item[2]

<<<<<<< HEAD
      Wear.new(data)
    end
    new(clothes_array)
  end

  def initialize(clothes)
    @clothes = clothes
  end
=======


      if @clothes.key?(item.cloth_type)
        @clothes[item.cloth_type] << item
      else
        @clothes[item.cloth_type] = Array(item)
      end

    end
    new
  end

  def random_suit_for_weather(temperature)
    @clothes.each_key do |cloth_type|
      suitable_clothes = @clothes[cloth_type].select { |item| item.match_weather?(temperature) }
>>>>>>> master

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
    offer_clothes = types_of_clothing.map do |type|
      by_type_and_temperature(type, users_temperature).sample
    end
    if offer_clothes.compact.empty?
      'К сожалению не нашлось подходящей одежды'
    else
      offer_clothes
    end
  end
end
