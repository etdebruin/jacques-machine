class CommandLine < OutputInterface
  
  def initialize
    puts "Welcome to the Jacques-Machine(tm)"
  end

  def prompt
    print "jacques-machine > "
  end

  def out(something)
    puts something
  end
end
