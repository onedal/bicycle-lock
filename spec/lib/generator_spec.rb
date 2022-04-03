require 'spec_helper'

RSpec.describe BicycleLock::Generator do

  let(:from) { [0, 0, 0] }
  let(:to) { [0, 1, 1] }
  let(:exclude) { [[0, 0, 2], [0, 0, 4]] }

  describe "#call" do
    it 'success result' do
      history_arr = BicycleLock::Generator.call(from: from, to: to, exclude: exclude)
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

    it 'success result' do
      history_arr = BicycleLock::Generator.call(from: [9, 1, 2], to: [7, 0, 0], exclude: [[8,0,0]])
      expect(history_arr.size).to eq(912-700)
      expect(history_arr).not_to include([8,0,0])
      expect(history_arr).to include([9,1,2])
      expect(history_arr).to include([7,0,0])
    end

  end

    context 'raise ArgumentError' do
      it 'from is not an array' do
        expect { BicycleLock::Generator.call(from: 'from', to: to, exclude: exclude) }.to raise_error(TypeError, 'from or to or exclude must be an array')
      end

      it 'to is not an array' do
        expect { BicycleLock::Generator.call(from: from, to: 'to', exclude: exclude) }.to raise_error(TypeError, 'from or to or exclude must be an array')
      end

      it 'exclude is not an array' do
        expect { BicycleLock::Generator.call(from: from, to: to, exclude: 'exclude') }.to raise_error(TypeError, 'from or to or exclude must be an array')
      end

  end
end