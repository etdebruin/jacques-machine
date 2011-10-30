class J
  def self.output=(custom_output)
    @output = custom_output
  end

  def self.say(something)
    @output.o(something)
  end
end

class Cmd
  def o(something)
    puts "commandline > #{something}" 
  end
end

class Campfire
  def o(something)
    puts "campfire > #{something}" 
  end
end

J::output = Cmd.new
J::say("Etienne")

J::output = Campfire.new
J::say("Kathryn")
