class Train
  attr_reader :type, :speed, :carriages, :current_station, :previous_station, :next_station
  attr_accessor :route

  def initialize
    @type = type_of
    @carriages = []
    @speed = 0
  end

  def accelerate_on(speed_value)
    @speed += speed_value
  end

  def brake
    @speed = 0
  end

  def add_carriage(carriage)
    carriages << carriage if speed.zero? && carriage.type == type
  end

  def remove_carriage
    carriages.pop if speed.zero? && carriages.size != 1
  end

  def move_to(station)
    @current_station = route.stations[route.stations.index(station)] if route.stations.include?(station)
    @next_station = route.stations[route.stations.index(current_station) + 1]
    @next_station = route.stations[route.stations.index(current_station) - 1]
  end

  protected

  def type_of
    ''
  end
end
