module BaseInterface

  def prompt
    raise "Your interface #prompt method is not yet implemented."
  end

  def listen_to
    raise "Your interface #listen_to method is not yet implemented.  This is also a good place to put JacquesMachine::comprehend()."
  end

  def speak_to(words)
    raise "Your interface #speak_to method is not yet implemented."
  end

end