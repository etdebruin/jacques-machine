require 'naturalingo'

module JacquesMachine

  def self.interactive
    print "jacques-machine > "
    interpret(gets.strip)    
  end 

  def self.interpret(something)
    unless command(something)
      Naturalingo::said_what(something)
    end
    interactive
  end

  def self.command(input)
    if input.to_s.downcase == 'exit'
      puts "Goodbye!"
      Process.exit
    end
  end

end

puts "Hi, my name is Jacques! What is yours?"
JacquesMachine::interactive
