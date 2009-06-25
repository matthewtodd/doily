module Doily
  class Reference
    def initialize(name)
      @name = name
    end

    def to_ruby(binding)
      binding.fetch(@name)
    end
  end
end
