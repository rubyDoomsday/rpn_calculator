module Rpn
  module Interface
    # /lib/interface/say.rb
    #
    # Handles messages to be said to the user
    module Say
      class << self
        def input_question
          puts Rpn::Messages::INPUT.yellow
        end

        def welcome_message
          puts Rpn::Messages::WELCOME.green
        end

        def exit_message
          puts Rpn::Messages::EXIT.yellow
        end

        def invalid_input(error = nil)
          puts "#{Rpn::Messages::INVALID} #{error}".red
        end

        def app_info
          splash_screen.each { |label, msg| puts "#{label}: #{msg}".blue }
        end

        def answer(result)
          puts "result: #{result}\n".green
        end

        private

        def splash_screen
          {
            Version:       Rpn::App::VERSION,
            By:            Rpn::Author::NAME,
            Email:         Rpn::Author::EMAIL,
            Instructions:  Rpn::Messages::INSTRUCTIONS,
            Exit:          Rpn::Messages::QUIT
          }
        end
      end
    end
  end
end
