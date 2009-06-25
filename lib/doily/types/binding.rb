module Doily
  # TODO this could delegate to / use / return a more generic Binding
  class ArgumentBinding
    def initialize(names, values, parent)
      raise ArgumentError.new(names, values) unless names.length == values.length

      @binding = Hash[*names.zip(values).flatten]
      @parent  = parent
    end

    def fetch(name)
      if @binding.has_key?(name)
        @binding[name]
      else
        @parent.fetch(name)
      end
    end
  end

  class DelegateBinding
    def initialize(delegate)
      @delegate = delegate
    end

    def fetch(name)
      @delegate.method(name)
    end
  end
end