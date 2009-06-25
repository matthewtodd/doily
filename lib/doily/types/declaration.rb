module Doily
  class Declaration
    def initialize(name)
      @name = name
    end

    def assign(reference, binding)
      binding.store(@name, reference.to_ruby(binding))
    end

    def to_ruby(binding)
      binding.store(@name, nil)
    end
  end
end