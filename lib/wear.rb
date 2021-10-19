class Wear
  attr_accessor :cloth_name, :cloth_type, :temp_range

  def initialize(params)
    @cloth_name = params.fetch(:cloth_name).chomp
    @cloth_type = params.fetch(:cloth_type).chomp
    temp_array = params.fetch(:temp_range).delete('()').split.map(&:to_i)
    @temp_range = temp_array[0]..temp_array[1]
  end

  def match_weather?(temp)
    temp_range.cover?(temp)
  end

  def to_s
    "#{cloth_name} (#{cloth_type}) #{temp_range}"
  end
end
