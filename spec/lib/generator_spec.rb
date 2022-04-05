require 'spec_helper'

RSpec.describe BicycleLock::Generator do
  let(:from) { [0, 0, 0] }
  let(:to) { [1, 1, 1] }
  let(:exclude) { [[0, 0, 1], [1, 0, 0]] }

  describe '#call' do
    it 'success result' do
      operation = BicycleLock::Generator.(from: from, to: to, exclude: exclude)
      expect(operation[:iterations]).to eq([
        [0, 0, 0],
        [0, 1, 0],
        [1, 1, 0],
        [1, 1, 1],
      ])
    end

    context 'success result' do
      from = [9, 1, 2]
      to =   [7, 0, 0]
      exclude = [[8, 0, 0]]
      subject = BicycleLock::Generator.(from: from, to: to, exclude: exclude)[:iterations]

      it 'operations equal' do
        expect(subject).to eq(
          [
            [9, 1, 2], [9, 1, 1], [9, 0, 1], [8, 0, 1], [7, 0, 1], [7, 0, 0],
          ]
        )
      end

      it 'element count in history_arr' do
        expect(subject.size).to eq(6)
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

    context 'Solution not found' do
      from = [0, 0, 0]
      to = [4, 5, 8]
      exclude = [
        [0, 0, 1], [1, 0, 0], [3, 0, 8], [4, 5, 0], [4, 5, 1], [4, 5, 1], [3, 3, 3], [3, 3, 2], [3, 2, 2], [2, 3, 2],
        [2, 2, 3],
      ]
      operation = BicycleLock::Generator.(from: from, to: to, exclude: exclude)

      it 'exclude lock' do
        expect(operation[:iterations]).to eq([
          [0, 0, 0], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 2, 1], [2, 2, 1], [2, 2, 2],
        ])
      end

      it 'error exist' do
        expect(operation[:errors]).to eq(true)
      end
    end
  end
end
