require_relative 'wear'

class Wardrobe
  attr_reader :clothes, :pick_clothes

  def initialize
    @clothes = {}
    @pick_clothes = []
  end

  def self.add_from_txt(directory)
    directory.each do |file|
      clothes_array = File.new(file).readlines

      data = {}
      data[:cloth_name] = clothes_array[0]
      data[:cloth_type] = clothes_array[1]
      data[:temp_range] = clothes_array[2]

      item = Wear.new(data)



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

      return :out_of_range if suitable_clothes.empty?

      pick_clothes << suitable_clothes.sample
    end
  end
end
