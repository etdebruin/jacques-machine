class CommandLine < OutputInterface
  
  def initialize
    puts "Welcome to the Jacques-Machine(tm)"
  end

  def prompt
    print "jacques-machine > "
  end

  def say(something)
    puts something
  end
end