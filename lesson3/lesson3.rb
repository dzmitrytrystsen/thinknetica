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
# Принимать маршрут следования +
# Перемещаться между станциями, указанными в маршруте. +
# Показывать предыдущую станцию, текущую, следующую, на основе маршрута +

class RailwayStation
  attr_reader :name, :trains_at_station

  def initialize(name)
    @name = name

    @trains_at_station = []
  end

  def add_train(train)
    @trains_at_station << train
  end
end

class Route
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = []
  end

  def add_station(station)
    @stations << station
  end

  def all_stations
    @route = []
    @route << @start_station << @stations << @end_station
    @route.flatten
  end
end

class Train
  attr_reader :type, :speed, :carriages
  attr_accessor :route

  def initialize(type, carriages)
    @type = type
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
end

# malinovka = RailwayStation.new('Малиновка')
# petrovshina = RailwayStation.new('Петровщина')
# mihalova = RailwayStation.new('Михалова')
# grushevka = RailwayStation.new('Грушевка')

# to_work = Route.new(malinovka, grushevka)
# to_work.add_station(petrovshina)
# to_work.add_station(mihalova)
# p to_work.all_stations.map(&:name)

# first_train = Train.new('Грузовой', 5)
# first_train.route = to_work
# puts first_train.route
