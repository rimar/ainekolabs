# Add test dir to the load path
$LOAD_PATH<<File.dirname(__FILE__)
require File.join(File.dirname(__FILE__),"..","lib","aineko")
require 'conf_test.rb'
