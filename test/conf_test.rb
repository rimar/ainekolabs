require 'test/unit'
require 'foo'


class TestConf < Test::Unit::TestCase
  def test_tos
    assert_equal("1,2", [1,2].to_s)
  end
  def test_conf
    puts "Foo has following confs: " + Foo.new.conf_list.to_s
    Foo.new.bar
    Foo.new.bar
  end
end
