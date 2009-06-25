module Doily
  class Call
    def initialize(name)
      @name = name
    end

    def execute(binding)
      binding.send(@name)
    end
  end
end
