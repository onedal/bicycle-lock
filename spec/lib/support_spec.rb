require 'spec_helper'
RSpec.describe BicycleLock::Support do
  include BicycleLock::Support

  let(:from) { [0, 0, 0] }
  let(:to) { [1, 0, 1] }
  let(:exclude) { [[1, 2, 3], [4, 5, 6]] }

  describe '#array_to_integer' do
    it 'success result' do
      expect(array_to_integer(to)).to eq(101)
    end

    context 'raise TypeError' do
      it 'arg must be an array' do
        expect { array_to_integer('to') }.to raise_error(TypeError, 'arg must be an array')
      end

      it 'arg index value must be int' do
        expect { array_to_integer([1, 2, '3']) }.to raise_error(TypeError, 'arg index value must be int')
      end

      it 'arg index value must be 0..9' do
        expect { array_to_integer([1, 2, 14]) }.to raise_error(ArgumentError, 'arg index value must be 0..9')
      end


    end
  end
end
