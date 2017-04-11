require 'spec_helper'

RSpec.describe Rpn::Interface::Menu do
  let(:subject) { described_class.new }

  it '#initialize' do
    expect(subject.calculator).to be_instance_of Rpn::Calculator::Base
  end
end
