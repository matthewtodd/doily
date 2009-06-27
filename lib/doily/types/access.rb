module Doily
  class Access
    def initialize(target, name)
      @target = target
      @name   = name
    end

    def assign(reference, binding)
      ruby_target    = @target.to_ruby(binding)
      ruby_name      = @name.to_ruby(binding)
      ruby_reference = reference.to_ruby(binding)

      if ruby_target.respond_to?(:has_key?)
        ruby_target.store(ruby_name, ruby_reference)
      else
        ruby_target.send("#{ruby_name}=", ruby_reference)
      end
    end

    def to_ruby(binding)
      ruby_target = @target.to_ruby(binding)
      ruby_name   = @name.to_ruby(binding)

      if ruby_target.respond_to?(ruby_name.to_s)
        if ruby_name == 'length'
          ruby_target.length
        else
          ruby_target.method(ruby_name)
        end
      else
        ruby_target[ruby_name]
      end
    end
  end
end