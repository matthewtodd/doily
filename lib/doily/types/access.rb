module Doily
  class Access
    def initialize(target, name)
      @target = target
      @name   = name
    end

    def to_ruby(binding)
      ruby_target = @target.to_ruby(binding)

      if ruby_target.respond_to?(:has_key?) && ruby_target.has_key?(@name)
        ruby_target.fetch(@name)
      else
        ruby_target.method(@name)
      end
    end
  end
end