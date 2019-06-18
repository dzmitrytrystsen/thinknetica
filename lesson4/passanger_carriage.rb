require_relative 'manufacture_module'

class PassangerCarriage
  include Manufacture

  attr_reader :type

  def initialize
    @type = 'Пассажирский'
  end
end
