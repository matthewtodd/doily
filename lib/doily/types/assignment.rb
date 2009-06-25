module Doily
  class Assignment
    def initialize(target, reference)
      @target    = target
      @reference = reference
    end

    def to_ruby(binding)
      @target.assign(@reference, binding)
    end
  end
end