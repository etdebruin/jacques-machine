require 'tinder'
require 'pp'

class Campfire
  include BaseInterface

  def initialize(key, room, subdomain)
    campfire = Tinder::Campfire.new subdomain, :token => key
    @room = campfire.find_room_by_name room
  end

  def does_not_require_salutation?
    false
  end

  def prompt
    # no prompt required
  end

  def listen_to
    @room.listen do |m|
      pp m
      if m[:type] == 'TextMessage'
        # Don't let Jacques try to comprehend his own messages
        JacquesMachine::comprehend(m[:body]) if m[:user][:name] != 'Jacques Machine'
      end
    end
  end

  def speak_to(words)
    @room.speak words
  end

end
