module Conf
  def conf(*names)
    puts "in conf: " + self.to_s
    names.each do |name| 
      module_eval <<-"end;"
        def #{name}
          "#{name.to_s * 3} #{self.to_s}"
        end
      end;
    end
  end
end

class Module
  include Conf
end

