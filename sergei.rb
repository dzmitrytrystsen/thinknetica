module InstanceCounter
  def self.included(base)
    base.extend(ClassMethods)
  end

  private

  def register_instance
    ClassMethods::B.new.register_instance
  end

  module ClassMethods
    def instances
      B.instances
    end

    class B
      def self.instances
        @@instances
      end

      def register_instance
        (@@instances ||= 0) && (@@instances += 1)
      end
    end
  end
end

class A
  include InstanceCounter

  def initialize
    @register_instance = register_instance
  end
end

10.times do
  instance = A.new
end

p A.instances