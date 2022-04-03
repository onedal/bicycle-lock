require 'spec_helper'

RSpec.describe BicycleLock::Generator do
  let(:from) { [0, 0, 0] }
  let(:to) { [0, 1, 1] }
  let(:exclude) { [[0, 0, 2], [0, 0, 4]] }

  describe '#call' do
    it 'success result' do
      history_arr = BicycleLock::Generator.(from: from, to: to, exclude: exclude)
      expect(history_arr).to eq([
        [0, 0, 0],
        [0, 0, 1],
        [0, 0, 3],
        [0, 0, 5],
        [0, 0, 6],
        [0, 0, 7],
        [0, 0, 8],
        [0, 0, 9],
        [0, 1, 0],
        [0, 1, 1],
      ])
    end

    context 'success result' do
      from = [9, 1, 2]
      to =   [7, 0, 0]
      exclude = [[8, 0, 0]]
      subject { BicycleLock::Generator.(from: from, to: to, exclude: exclude) }

      it 'element count in history_arr' do
        expect(subject.size).to eq(912 - 700)
      end

      it 'exclude params' do
        expect(subject).not_to include([8, 0, 0])
      end

      it 'include firts element' do
        expect(subject).to include([9, 1, 2])
      end

      it 'include end element' do
        expect(subject).to include([7, 0, 0])
      end
    end

    context 'raise ArgumentError' do
      it 'from is not an array' do
        expect do
          BicycleLock::Generator.(from: 'from', to: to,
                                      exclude: exclude)
        end.to raise_error(TypeError, 'from or to or exclude must be an array')
      end

      it 'to is not an array' do
        expect do
          BicycleLock::Generator.(from: from, to: 'to',
                                      exclude: exclude)
        end.to raise_error(TypeError, 'from or to or exclude must be an array')
      end

      it 'exclude is not an array' do
        expect do
          BicycleLock::Generator.(from: from, to: to, exclude: 'exclude')
        end.to raise_error(TypeError, 'from or to or exclude must be an array')
      end
    end
  end
end
