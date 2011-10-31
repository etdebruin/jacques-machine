class CommandLine < OutputInterface
  
  def initialize
    puts "Welcome to the Jacques-Machine(tm)"
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
