module Doily
  class Array
    def initialize(members)
      @members = members
    end

    def to_ruby(binding)
      @members.map { |member| member.to_ruby(binding) }
    end
  end
end