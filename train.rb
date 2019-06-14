class Train
  attr_reader :type, :speed, :carriages, :current_station, :previous_station, :next_station
  attr_writer :route

  def accelerate_on(speed)
    @speed += speed
  end

  def brake
    @speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage if speed.zero? && carriage.type == type
  end

  def remove_carriage
    @carriages.pop if speed.zero? && carriages.length != 1
  end

  def move_to(station_index)
    return false unless speed.positive?

    @current_station = @route.stations[station_index]
    @previous_station = @route.stations[station_index - 1]
    @next_station = @route.stations[station_index + 1]
  end
end
