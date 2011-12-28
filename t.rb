module B
  def rara
    @rara ||= Array.new
  end

  def rara=(value)
    @rara = value
  end

end

class A
  include B

  def show
    puts @rara
  end

  def add
    rara.push('hi')
  end

end

foo = A.new
foo.add
foo.show
