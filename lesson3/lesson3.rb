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
  attr_reader :name

  def initialize(name)
    @name = name

    @trains = {}
  end

  def get_train(train)
    @trains <= train
  end

  def show_trains
    puts "Trains at station: #{trains}"
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

  def show_stations
    puts route
  end

  def route
    route = []
    route << @start_station << @stations << @end_station
    route.flatten
  end
end

class Train
  attr_reader :type

  def initialize(type, carriages)
    @type = type
    @carriages = carriages

    @speed = 0
    @route = []
  end

  def accelerate(speed)
    @speed += speed
    puts "Train sped on #{@speed} km/h"
  end

  def speed
    puts "Current speed is: #{@speed} km/h"
  end

  def brake
    @speed = 0
    puts 'Train has stoped'
  end

  def carriages
    puts "Train has #{@carriages} carriages"
  end

  def add_carriage
    if @speed.zero?
      @carriages += 1

    else
      puts 'Stop the train first!'
    end
  end

  def remove_carriage
    if @speed.zero?
      if @carriages != 1
        @carriages -= 1
      else
        puts 'Train has last carriage'
      end

    else
      puts 'Stop the train first!'
    end
  end

  def get_route(route)
    @route = route
  end
end

malinovka = RailwayStation.new('Малиновка')
petrovshina = RailwayStation.new('Петровщина')
mihalova = RailwayStation.new('Михалова')
grushevka = RailwayStation.new('Грушевка')
