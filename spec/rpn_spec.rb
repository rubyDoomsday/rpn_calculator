require 'spec_helper'

RSpec.describe Rpn do
  context 'App' do
    let(:subject) { described_class::App }

    it 'has a version' do
      expect(subject::VERSION).to_not be_empty
      expect(subject::VERSION).to eq '0.0.1'
    end

    it 'has a revision' do
      expect(subject::REVISION).to_not be_empty
      expect(subject::REVISION).to eq '20170510'
    end

    it 'has a summary' do
      expect(subject::SUMMARY).to_not be_empty
      expect(subject::SUMMARY).to eq 'Reverse Polish Notation calculator'
    end
  end

  context 'Author' do
    let(:subject) { described_class::Author }

    it 'has a name' do
      expect(subject::NAME).to_not be_empty
      expect(subject::NAME).to eq 'Rebecca Chapin'
    end

    it 'has a homepage' do
      expect(subject::EMAIL).to_not be_empty
      expect(subject::EMAIL).to eq 'creative@rebeccachapin.com'
    end

    it 'has a summary' do
      expect(subject::HOMEPAGE).to_not be_empty
      expect(subject::HOMEPAGE).to eq 'https://github.com/rubyDoomsday'
    end
  end
end
