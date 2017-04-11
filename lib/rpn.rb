require_relative 'calculator'
require_relative 'interface'

# /lib/rpn.rb
module Rpn
  # RPN Calculator
  #
  # A command-line calculator which uses reverse polish notation
  #
  # @see ../docs
  module App
    ALL = [
      VERSION   = '0.0.1'.freeze,
      REVISION  = '20170510'.freeze,
      SUMMARY   = 'Reverse Polish Notation calculator'.freeze
    ].freeze
  end

  module Author
    ALL = [
      NAME      = 'Rebecca Chapin'.freeze,
      EMAIL     = 'creative@rebeccachapin.com'.freeze,
      HOMEPAGE  = 'https://github.com/rubyDoomsday'.freeze
    ].freeze
  end

  module Messages
    ALL = [
      INPUT         = "\nWhat would you like to calculate?".freeze,
      WELCOME       = 'Weclome to RPN Calculator'.freeze,
      EXIT          = 'It\'s been fun, bye!'.freeze,
      INVALID       = 'Invalid input Please try again: '.freeze,
      INSTRUCTIONS  = 'Enter a string such as \'1 2 3 4 5 +\''.freeze,
      QUIT          = "'q' to quit, 'c' to clear".freeze
    ].freeze
  end
end
