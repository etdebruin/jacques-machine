require File.expand_path(File.join(File.dirname(__FILE__), 'jacques-machine', 'configuration.rb'))

Dir[File.dirname(__FILE__) + '/jacques-machine/interfaces/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/jacques-machine/actions/*.rb'].each {|file| require file }

#require 'naturalingo'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'naturalingo', 'lib', 'naturalingo.rb'))

module JacquesMachine
  extend self

  @names = ["Jacques", "Jacques-Machine"]

  def audience=(audience)
    @audience = audience
  end

  def converse
    @audience.listen_to
  end

  def comprehend(sentences)
    @lingo = Natural::Lingo.new(@names)
    @lingo.heard=sentences

    # did I hear my name?
    if @lingo.talking_to_me? || @audience.does_not_require_salutation?
      puts "yay, you're talking to me"

      # did you ask me to do anything for you?
      do_simple_commands

      #@audience.speak_to(lingo.heard) unless lingo.heard.nil?
    end
  end

  def do_simple_commands
    @lingo.heard_these_words.each do |word|
      if Configuration.invoke.has_key?(word)
        sub = Object.const_get(Configuration.invoke[word]).new
        puts sub.action
      end
    end
  end

  def command(input)
    if input.to_s.downcase == 'exit'
      @audience.speak_to("Goodbye!")
      Process.exit
    end
  end

end
