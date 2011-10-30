require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'configuration.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'interface.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'campfire.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'commandline.rb'))

require 'naturalingo'

module JacquesMachine

  def self.output=(selected_output)
    @output = selected_output
  end

  def self.interactive
    @output.prompt
    interpret(gets.strip)    
  end

  def self.interpret(something)
    unless command(something)
      response = Naturalingo::heard(something)
      @output.out(response)
    end
    interactive
  end

  def self.command(input)
    if input.to_s.downcase == 'exit'
      @output.out("Goodbye!")
      Process.exit
    end
  end

end
