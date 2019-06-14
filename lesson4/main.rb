require_relative 'train'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'passanger_carriage'
require_relative 'cargo_carriage'
require_relative 'railway_station'
require_relative 'route'

malinovka = RailwayStation.new('малиновка')
petrovka = RailwayStation.new('петровщина')
mihalova = RailwayStation.new('михалова')
grushevka = RailwayStation.new('грушевка')

route = Route.new(malinovka, petrovka)
route.add_station(1, petrovka)

passanger_train = PassangerTrain.new

passanger_carriage = PassangerCarriage.new
cargo_carriage = CargoCarriage.new

passanger_train.add_carriage(passanger_carriage)
# passanger_train.route = route
# passanger_train.move_to(malinovka)
# p passanger_train.current_station
# p passanger_train.next_station
# p passanger_train.previous_station


# malinovka.add_train(first_train)
# malinovka.add_train(second_train)
# malinovka.add_train(third_train)
# p malinovka.trains_at_station
# p malinovka.trains_by_type
# malinovka.remove_train(second_train)
# p malinovka.trains_by_type

# to_work = Route.new(malinovka, mihalova)
# to_work.add_station(1, petrovka)