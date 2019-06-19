class RailwayStation
  attr_reader :name, :trains_at_station

  @@all = []

  # В классе RailwayStation (жд станция) создать метод класса all, который выводит список всех станций, созданных на данный момент
  def self.all
    @@all
  end

  def initialize(name)
    @name = name.capitalize
    @trains_at_station = []
    @@all << self
  end

  def add_train(train)
    trains_at_station << train
  end

  def remove_train(train)
    trains_at_station.delete(train)
  end

  def trains_by_type
    create_hash_with_types
  end

  private

  def create_hash_with_types
    trains_by_type = Hash.new(0)
    types = trains_at_station.map(&:type)
    types.each { |type| trains_by_type[type] += 1 }
    trains_by_type
  end
end
