module BaseAction

  def invoked_by
    raise "Your action #{self.class.name} method is not yet implemented."
  end

end