require 'conf'

class Foo
  conf :a, :b
  def bar
    puts "a=" + a
    puts "b=" + b
    
  end
end


Foo.new.bar
Foo.new.bar
