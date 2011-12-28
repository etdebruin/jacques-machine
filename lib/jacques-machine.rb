require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'configuration.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'base_interface.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'campfire.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'interfaces', 'commandline.rb'))

#require 'naturalingo'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'naturalingo', 'lib', 'naturalingo.rb'))

module JacquesMachine
  extend self

  def audience=(audience)
    @audience = audience
  end

  def converse
    @audience.listen_to
  end

  def comprehend(sentences)
    response = Naturalingo::heard(sentences)
    @audience.speak_to(response) unless response.nil?
  end

  def command(input)
    if input.to_s.downcase == 'exit'
      @audience.speak_to("Goodbye!")
      Process.exit
    end
  end

end
