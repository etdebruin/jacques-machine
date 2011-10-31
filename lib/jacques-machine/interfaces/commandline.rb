class CommandLine < OutputInterface
  
  def initialize
    puts "Welcome to the Jacques-Machine(tm)"
  end

  def prompt
    print "jacques-machine > "
  end

  def interact
    while true
      prompt
      JacquesMachine::interpret(gets.strip)
    end
  end

  def out(something)
    puts something
  end

end
