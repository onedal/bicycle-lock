require 'spec_helper'
include BicycleLock::Support
RSpec.describe BicycleLock::Support do

  let(:from) { [0, 0, 0] }
  let(:to) { [1, 0, 1] }
  let(:exclude) { [[1, 2, 3], [4, 5, 6]] }


  describe "#array_to_integer" do
    it 'success result' do
      expect(array_to_integer(to)).to eq(101)
    end

    context 'raise TypeError' do
      it 'to is not an array' do
        expect { array_to_integer('to') }.to raise_error(TypeError, 'arg must be an array')
      end
    end
  end



end