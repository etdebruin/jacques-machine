class CommandLine
  include BaseInterface
  
  def initialize
    puts "Hi, my name is Jacques Machine!  Talk to me."
  end

  def does_not_require_salutation?
    true
  end

  def prompt
    print "> "
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
