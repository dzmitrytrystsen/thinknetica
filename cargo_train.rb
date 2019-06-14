class CargoTrain < Train
  def initialize
    @type = 'Грузовой'
    @carriages = []
    @speed = 0
  end
end