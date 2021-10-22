class Wear
  attr_accessor :cloth_name, :cloth_type, :temp_range

  def initialize(params)
    @cloth_name = params[:cloth_name]
    @cloth_type = params[:cloth_type]
    @temp_range = params[:temp_range]
  end

  def match_weather?(temp)
    temp_range.cover?(temp)
  end

  def to_s
    "#{cloth_name} (#{cloth_type}) #{temp_range}"
  end
end
