module Rpn
  module Calculator
    # /lib/calculator/base.rb
    #
    # Base class for all calculator functions.
    class Base
      include Rpn::Calculator::Math

      attr_accessor :input
      attr_reader :answer, :parsed, :errors

      NUMBER = /(\d+(\.\d+)?)/

      def initialize
        clear
      end

      # Clears current state
      def clear
        @errors = []
        @answer = nil
        @parsed = []
        @input  = ''
      end

      # Does math against the provided string
      # @param new_string [String] the input to compute. eg. '1 2 3 4 +'
      # @return [Float] the computed sum
      def calculate(new_string = '')
        @input += " #{new_string}"
        sub_total = nil

        parsed_input.each do |section|
          these_numbers = sub_total ? [sub_total].push(*section[:numbers]) : section[:numbers]
          sub_total = compute(these_numbers, section[:operator])
        end

        @answer = sub_total
      rescue ArgumentError => e
        @input.gsub!(new_string, '')
        raise e
      end

      private

      # Determines if calculation is needed or return last numerical input
      # @param numbers [Array] eg. [1.0, 2.0, 3.0]
      # @param operator [String] eg '+'
      # @return [Float] sum total of provided calculation params
      def compute(numbers, operator)
        raise ArgumentError if numbers.empty?
        return calculate_by_type(numbers, operator) unless operator.nil?
        numbers.last
      end

      # parses input string of variable length and content into actionable data
      # @return [Array] [{ numbers: [], operator: '' }]
      def parsed_input
        sets = []
        input_array = @input.split(' ')

        loop do
          sets << { numbers: extract_numbers(input_array),
                    operator: extract_operator(input_array) }

          input_array.shift(extract_numbers(input_array).count + 1)
          break if input_array.empty?
        end

        @parsed = sets
      end

      # Extracts numbers leading up to an operator
      # @param input_array [Array] eg. ['1', '2', '3', '+']
      # @return [Array] eg [1.0, 2.0, 3.0]
      def extract_numbers(input_array)
        set = input_array.take_while { |i| i.match(NUMBER) }
        raise ArgumentError if set.count > 2
        set.map(&:to_f)
      end

      # Extracts the first math operator in the string
      # @param input_array [Array] eg. ['1', '2', '3', '+']
      # @return [String] eg. '+'
      def extract_operator(input_array)
        input_array.detect { |i| !i.match(NUMBER) }
      end
    end
  end
end
