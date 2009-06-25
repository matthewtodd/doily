module Doily
  class Access
    def initialize(target, name)
      @target = target
      @name   = name
    end

    def assign(reference, binding)
      ruby_target    = @target.to_ruby(binding)
      ruby_reference = reference.to_ruby(binding)

      if ruby_target.respond_to?(:has_key?)
        ruby_target.store(@name, ruby_reference)
      else
        ruby_target.send("#{@name}=", ruby_reference)
      end
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