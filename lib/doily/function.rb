module Doily
  class Function
    def initialize(statements)
      @statements = statements
    end

    def bind(binding)
      @binding = binding
      self
    end

    def call
      result = nil
      @statements.each do |statement|
        result = statement.execute(@binding)
      end
      result
    end
  end
end