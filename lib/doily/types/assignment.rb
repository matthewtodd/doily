module Doily
  class Assignment
    def initialize(name, reference)
      @name      = name
      @reference = reference
    end

    def to_ruby(binding)
      binding.store(@name, @reference.to_ruby(binding))
    end
  end
end