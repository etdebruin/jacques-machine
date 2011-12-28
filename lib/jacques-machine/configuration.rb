module JacquesMachine
  class Configuration
    def self.options_and_defaults
      [
        [:campfire_key, nil],
        [:campfire_subdomain, nil],
        [:campfire_room, nil],
        [:audience, nil],
        [:invoke, Hash.new],
        [:debug, false]
      ]
    end

    # define getters and setters for all configuration settings
    self.options_and_defaults.each do |option, default|
      class_eval(<<-END, __FILE__, __LINE__ + 1)

        @@#{option} = default unless defined? @@#{option}

        def self.#{option}
          @@#{option}
        end

        def self.#{option}=(obj)
          @@#{option} = obj
        end

      END

    end
  end
end