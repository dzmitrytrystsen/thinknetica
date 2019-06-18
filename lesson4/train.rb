require_relative 'manufacture_module'
require_relative 'instance_counter_module'

class Train
  include Manufacture
  include InstanceCounter

  attr_reader :type, :carriages, :current_station, :train_number
  attr_accessor :route, :speed

  @@all_trains = []

  def self.all_trains
    @@all_trains
  end

  # В классе Train создать метод класса find, который принимает номер поезда и возвращает объект поезда по номеру или nil, 
  # если поезд с таким номером не найден.
  def self.find(train_number)
    @@all_trains.detect { |train| train.train_number == train_number}
  end

  def initialize(train_number)
    @train_number = train_number
    @type = type_of
    @carriages = []
    @speed = 0
    @@all_trains << self

    register_instance
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
  end

  def next_station
    @next_station = route.stations[route.stations.index(current_station) + 1]
  end

  def previous_station
    @previous_station = route.stations[route.stations.index(current_station) - 1]
  end

  protected

  def type_of
    ''
  end
end

first_train = Train.new(365)
second_train = Train.new(12)
third_train = Train.new(999)

puts Train.instances