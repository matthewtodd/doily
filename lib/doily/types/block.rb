module Doily
  class Block
    def initialize(statements = [])
      @statements = statements
    end

    def to_ruby(binding)
      binding = LocalBinding.new(binding)

      result = nil
      @statements.each do |statement|
        result = statement.to_ruby(binding)
      end
      result
    end
  end
end