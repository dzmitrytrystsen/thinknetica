# С этого занятия мы будем создавать прилоежение, которое поможет диспетчеру железнодорожной странции управлять поездами: 
# принимать, отправлять, показывать информацию и т.д. (точнее, мы будем создавать его объектную модель). Нужно написать:
# Классы Train и RailwayStation, Route для поезда, ж.д. станции и маршрута соответственно.
# Станция:
# Имеет название, которое указывается при ее создании
# Может принимать поезда
# Может показывать список всех поездов на станции, находящиеся в текущий момент
# Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
# Маршрут:
# Имеет начальную и конечную станцию, а также список промежуточных станций
# Может добавлять станцию в список
# Может удалять станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
# Поезд:
# Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
# Поезд может делать следующие вещи:
# набирать скорость
# показывать текущую скорость
# тормозить
# показывать количество вагонов
# прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Принимать маршрут следования
# Перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, на основе маршрута

class RailwayStation
  attr_reader :name, :trains_at_station
  attr_writer :start_station, :end_station

  def initialize(name)
    @name = name

    @trains_at_station = []
  end

  def add_train(train)
    @trains_at_station << train
  end

  def trains_by_type
    trains_by_type = Hash.new(0)
    types = @trains_at_station.map(&:type)
    types.each { |type| trains_by_type[type] += 1 }
    trains_by_type
  end

  def remove_train(train)
    @trains_at_station.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [@start_station, @end_station]
  end

  def add_station(index, station)
    @stations.insert(index, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end
end

class Train
  attr_reader :type, :speed, :carriages, :current_station, :previous_station, :next_station
  attr_accessor :route

  def initialize(type, carriages)
    @type = type.downcase
    @carriages = carriages

    @speed = 0
  end

  def accelerate(speed)
    @speed += speed
  end

  def brake
    @speed = 0
  end

  def add_carriage
    @carriages += 1 if speed.zero?
  end

  def remove_carriage
    @carriages -= 1 if @speed.zero? && @carriages != 1
  end

  def move_to(station_index)
    @current_station = @route.stations[station_index]
    @previous_station = @route.stations[station_index - 1]
    @next_station = @route.stations[station_index + 1]
  end
end