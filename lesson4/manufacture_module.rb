# Создать модуль, который позволит указывать название компании-производителя и
# получать его. Подключить модуль к классам Вагон и Поезд

module Manufacture
  def manufacturer=(manufacturer)
    @manufacturer = manufacturer
  end

  def manufacturer
    @manufacturer
  end
end
