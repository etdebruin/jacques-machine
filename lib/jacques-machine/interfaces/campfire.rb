require 'tinder'
require 'pp'

class Campfire < OutputInterface

  def initialize(key, room, subdomain)
    campfire = Tinder::Campfire.new subdomain, :token => key
    @room = campfire.find_room_by_name room
  end

  def prompt
    # no prompt required
  end

  def interact
    @room.listen do |m|
      pp m
      if m[:type] == 'TextMessage'
        JacquesMachine::interpret(m[:body]) if m[:user][:id] == 282550
      end
    end
  end

  def out(something)
    @room.speak something
  end

end
