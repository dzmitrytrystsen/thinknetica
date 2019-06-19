# Усложенное задание: Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, 
# которые подключаются автоматически при вызове include в классе:
# Методы класса:
# instances, который возвращает кол-во экземпляров данного класса
# Инастанс-методы:
# register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора. 
# При этом, данный метод не должен быть публичным.

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      Class.instances
    end

    class Class
      def self.instances
        @@instances
      end

      def register_instance
        (@@instances ||= 0) && (@@instances += 1)
      end
    end
  end

  module InstanceMethods
    private

    def register_instance
      ClassMethods::Class.new.register_instance
    end
  end
end
