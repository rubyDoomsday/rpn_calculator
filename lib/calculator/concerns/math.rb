module Rpn
  module Calculator
    # /lib/calculator/concerns/math.rb
    #
    # Math operations
    module Math
      ALL_TYPES = [
        ADDITION        = '+'.freeze,
        SUBTRACTION     = '-'.freeze,
        MULTIPLICATION  = '*'.freeze,
        DIVISION        = '/'.freeze
      ].freeze

      # Performs calculations based on the operator type
      # @param number_set [Array] [1.0, 2.3, 5]
      # @param operator [String] '+'
      # @return [Float] sum total of operation
      def calculate_by_type(number_set, operator)
        case operator
        when ADDITION       then add(number_set)
        when SUBTRACTION    then subtract(number_set)
        when DIVISION       then divide(number_set)
        when MULTIPLICATION then multiply(number_set)
        else raise ArgumentError, "Sorry Dave. I don't support #{operator} yet."
        end
      end

      # Param numbers [Array] set of numbers to run math function against
      def add(numbers)
        numbers.inject { |sum, n| sum + n }
      end

      # Param numbers [Array] set of numbers to run math function against
      def subtract(numbers)
        numbers.inject { |sum, n| sum - n }
      end

      # Param numbers [Array] set of numbers to run math function against
      def divide(numbers)
        numbers.inject { |sum, n| sum / n }
      end

      # Param numbers [Array] set of numbers to run math function against
      def multiply(numbers)
        numbers.inject { |sum, n| sum * n }
      end
    end
  end
end
