class CommandLine
  include BaseInterface
  
  def initialize
    puts "Hi, my name is Jacques Machine!"
  end

  def prompt
    print "jacques-machine > "
  end

  def listen_to
    while true
      prompt
      JacquesMachine::comprehend(gets.strip)
    end
  end

  def speak_to(something)
    puts something
  end
end
