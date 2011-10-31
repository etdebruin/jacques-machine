require 'tinder'
require 'pp'

class Campfire
  include BaseInterface

  def initialize(key, room, subdomain)
    campfire = Tinder::Campfire.new subdomain, :token => key
    @room = campfire.find_room_by_name room
  end

  def prompt
    # no prompt required
  end

  def listen_to
    @room.listen do |m|
      pp m
      if m[:type] == 'TextMessage'
        # strictly speaking, we should not have these if's because the JacquesMachine should be able to handle this
        JacquesMachine::comprehend(m[:body]) if m[:body] =~ /Jacques/i && m[:user][:name] != 'Jacques Machine'
      end
    end
  end

  def speak_to(words)
    @room.speak words
  end

end
