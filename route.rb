class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(to_index, station)
    stations.insert(to_index, station)
  end

  def remove_station(station)
    stations.delete(station)
  end
end
