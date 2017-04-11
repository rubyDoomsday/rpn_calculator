require 'spec_helper'

RSpec.describe Rpn::Interface::Say do
  let(:subject) { described_class }

  context 'it speaks!' do
    it '#input_question' do
      STDOUT.should_receive(:puts).with(Rpn::Messages::INPUT.yellow)
      subject.input_question
    end

    it '#welcome_message' do
      STDOUT.should_receive(:puts).with(Rpn::Messages::WELCOME.green)
      subject.welcome_message
    end

    it '#exit_message' do
      STDOUT.should_receive(:puts).with(Rpn::Messages::EXIT.yellow)
      subject.exit_message
    end

    it '#invalid_input' do
      STDOUT.should_receive(:puts).with("#{Rpn::Messages::INVALID} ".red)
      subject.invalid_input
    end
  end
end
