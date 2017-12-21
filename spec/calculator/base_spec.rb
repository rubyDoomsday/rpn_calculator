require 'spec_helper'

RSpec.describe Rpn::Calculator::Base do
  let(:subject) { described_class.new }

  context 'simple input' do
    let(:input) { '1 3 +' }

    it '#initialize' do
      expect(subject.input).to eq ''
      expect(subject.answer).to eq nil
      expect(subject.errors).to be_empty
      expect(subject.parsed).to be_empty
    end

    it 'clears answer' do
      expect(subject.calculate(input)).to eq 4.0
      subject.clear
      expect(subject.answer).to eq nil
    end

    it 'chains together calculations without operator' do
      expect(subject.calculate(input)).to eq 4.0
      subject.calculate('2 +')
      expect(subject.answer).to eq 6.0
    end

    it 'chains together calculations without operator' do
      expect(subject.calculate(input)).to eq 4.0
      expect(subject.calculate('2')).to eq 2.0
      expect(subject.calculate('+')).to eq 6.0
    end
  end

  context 'complex input' do
    let(:complexity) do
      [
        '1 3 +',                # 4
        '1 3 + 2 *',            # 8
        '1 3 -',                # -2
        '4 2 /',                # 2
        '2 4 * 3 + 10 -',       # 1
        '2',                    # 2
        '12 12 + 1 * 3 + 2 /', # 13.5
        '1.5 2.3 +'             # 3.8
      ]
    end

    it 'does complex math' do
      answers = complexity.map do |input|
        subject = described_class.new
        subject.calculate(input)
      end
      expect(answers).to eq [4.0, 8.0, -2.0, 2.0, 1.0, 2.0, 13.5, 3.8]
    end
  end

  context 'new tests' do
    let(:input) { '1 2 3 4 +' }

    it 'raises error on more that 2 numbers in set' do
      expect { subject.calculate(input) }.to raise_error ArgumentError
    end
  end

  context 'with errors' do
    context 'invalid math' do
      let(:input) { '1 3 %' }

      it 'only calculates supported functions' do
        expect { subject.calculate(input) }.to raise_error(ArgumentError)
      end
    end

    context 'no operator' do
      let(:input) { '1 3' }

      xit 'raises an error when no operator provided' do
        expect { subject.calculate(input) }.to raise_error ArgumentError
      end
    end

    context 'no input' do
      it 'returns first digit' do
        expect { subject.calculate('') }.to raise_error ArgumentError
      end
    end

    context 'no spaces provided' do
      it 'returns the number' do
        expect(subject.calculate('1+')).to eq 1.0
      end
    end
  end
end
