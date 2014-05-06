module HMMC
  class Entity

    # This is a pattern so you can do Game.new(:players => []) for example.
    def initialize(attrs={})
      attrs.each do |attr_name, value|
        getter = "#{attr_name}"
        if self.class.method_defined?(getter)
          self.instance_variable_set("@#{attr_name}", value)
        end
      end
    end
  end
end
