require_relative 'manufacture_module'

class CargoCarriage
  include Manufacture

  attr_reader :type

  def initialize
    @type = 'Грузовой'
  end
end