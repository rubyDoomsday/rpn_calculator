module Rpn
  module Interface
    # /lib/interface/menu.rb
    #
    # Handles all interface menu operations
    class Menu
      attr_accessor :calculator

      # Ends program safely
      class SafeExit < RuntimeError
        def initialize(message)
          super(message)
        end
      end

      def initialize
        @calculator = Rpn::Calculator::Base.new
        welcome
      end

      # Main Menu loop
      def run
        loop do
          begin
            if input = user_input
              Say.answer(calculator.calculate(input))
            end
          rescue SafeExit
            Say.exit_message
            break
          rescue => e
            error_handler(e.message)
          end
        end
      end

      private

      # KISS menu option handler
      # @return [String] user input
      def user_input
        Say.input_question
        input = gets.chomp
        return calculator.clear if input.casecmp('c').zero?
        return input unless input.casecmp('q').zero?
        raise SafeExit, 'user quit'
      rescue
        raise SafeExit, 'ctrl-d'
      end

      # @param [String] error message
      def error_handler(error)
        puts Say.invalid_input(error)
      end

      def welcome
        Say.welcome_message
        Say.app_info
      end
    end
  end
end
