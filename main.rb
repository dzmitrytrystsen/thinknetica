require_relative 'train'
require_relative 'cargo_train'
require_relative 'passanger_train'
require_relative 'passanger_carriage'
require_relative 'cargo_carriage'

first_cargo_train = CargoTrain.new
first_passanger_train = PassangerTrain.new

passanger_carriage = PassangerCarriage.new
cargo_carriage = CargoCarriage.new

first_cargo_train.add_carriage(passanger_carriage)
p first_cargo_train.carriages
first_cargo_train.add_carriage(cargo_carriage)
p first_cargo_train.carriages



