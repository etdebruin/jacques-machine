require 'tinder'
require 'pp'

class Campfire < OutputInterface

  def initialize
    campfire = Tinder::Campfire.new Configuration.campfire_subdomain, :token => Configuration.campfire_key
    room = campfire.find_room_by_name Configuration.campfire_room
    self.listen(room)
  end

  def listen(room)
    room.listen do |m|
      #pp m
      room.speak "My Father says: #{m[:body]}" if m[:user][:id] == 282550
    end
  end
end
