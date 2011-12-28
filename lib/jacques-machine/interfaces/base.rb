module BaseInterface

  def require_salutation?
    raise "Your interface #{self.class.name} method is not yet implemented."
  end

  def prompt
    raise "Your interface #{self.class.name} method is not yet implemented."
  end

  def listen_to
    raise "Your interface #{self.class.name} method is not yet implemented.  This is also a good place to put JacquesMachine::comprehend()."
  end

  def speak_to(words)
    raise "Your interface #{self.class.name} method is not yet implemented."
  end

end