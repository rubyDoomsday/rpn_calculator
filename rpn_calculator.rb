require 'rubygems'
require 'bundler/setup'
require_relative 'lib/rpn'

if __FILE__ == $PROGRAM_NAME
  app = Rpn::Interface::Menu.new
  app.run
end
