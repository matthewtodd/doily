module Doily
  class DelegateBinding
    def initialize(delegate)
      @delegate = delegate
    end

    def fetch(name)
      @delegate.method(name)
    end
  end

  class Binding
    def initialize(parent, contents={})
      @parent   = parent
      @contents = contents
    end

    def fetch(name)
      if @contents.has_key?(name)
        @contents[name]
      else
        @parent.fetch(name)
      end
    end
  end

  class ArgumentBinding < Binding
    def initialize(parent, names, values)
      raise ArgumentError.new(names, values) unless names.length == values.length
      contents = {}
      names.zip(values).each { |key, value| contents[key] = value }
      super parent, contents
    end
  end

  class LocalBinding < Binding
    def store(name, value)
      @contents[name] = value
    end
  end
end