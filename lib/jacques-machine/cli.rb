require 'optparse'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'jacques-machine.rb'))

module JacquesMachine

  class Cli
    def self.run(args, out = STDOUT)
      JacquesMachine::interactive
    end
  end

end
