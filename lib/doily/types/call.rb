module Doily
  class Call
    def initialize(target, args)
      @target = target
      @args   = args
    end

    def to_ruby(binding)
      @target.to_ruby(binding).call(*@args.map { |arg| arg.to_ruby(binding) })
    end
  end
end
