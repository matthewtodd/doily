module Doily
  class Reference
    def initialize(name)
      @name = name
    end

    def assign(reference, binding)
      binding.store(@name, reference.to_ruby(binding))
    end

    def to_ruby(binding)
      binding.fetch(@name)
    end
  end
end
