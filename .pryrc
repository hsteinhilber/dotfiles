# use #inspect instead of #to_s when printing results
Pry.print = proc do |output, value|
  case value
  when Exception
    Pry.DEFAULT_EXCEPTION_HANDLER.call output, value
  else
    if Pry.color
      output.puts "=> #{CodeRay.scan(value.inspect, :ruby).term}"
    else
      output.puts "=> #{value.inspect}"
    end
  end
end

# custom methods for several modules and classes
module Kernel
  def r(*objects)
    raise RuntimeError, objects.map{|o|o.inspect}.join("\n"), caller
  end
end

class Integer
  def prime?
    return false if self <= 1
    return true if self == 2
    return false if self % 2 == 0
    return true if self < 9
    return false if self % 3 == 0
    factor = 3
    return false if self % factor == 0 while factor += 2 and self >= factor ** 2
    true
  end
end

class Object
  def metaclass
    class << self; self; end
  end

  def meta_eval(&block)
    metaclass.instance_eval(&block)
  end

  def ls(object = self)
    (object.methods - Class.instance_methods).sort!
  end

  def lsi(object)
    (object.instance_methods - Object.instance_methods).sort!
  end
end

class Module
  def lsi(object = self)
    super(object)
  end
end

class String
  def checksum
    each_byte.reduce(0,:+) & 255
  end
end
