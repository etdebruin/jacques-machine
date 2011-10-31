require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'configuration.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'base_interface.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'campfire.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'commandline.rb'))

#require 'naturalingo'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'naturalingo', 'lib', 'naturalingo.rb'))

module JacquesMachine

  def self.audience=(audience)
    @audience = audience
  end

  def self.converse
    @audience.listen_to
  end

  def self.comprehend(sentence)
    unless command(sentence)
      response = Naturalingo::heard(sentence)
      @audience.speak_to(response)
    end
  end

  def self.command(input)
    if input.to_s.downcase == 'exit'
      @audience.speak_to("Goodbye!")
      Process.exit
    end
  end

end
