require 'spec_helper'
include BicycleLock::Validation

RSpec.describe BicycleLock::Validation do

  let(:from) { [0, 0, 0] }
  let(:to) { [1, 0, 1] }
  let(:exclude) { [[1, 2, 3], [4, 5, 6]] }

  describe "#validate_data!" do
    it "success result" do
      expect(validate_data!(from: from, to: to , exclude: exclude)).to be true
    end

    it 'raise ArgumentError' do
      expect { validate_data!(from: from, to: [0,0,0,0], exclude: exclude) }.to raise_error(ArgumentError, 'solution not found')
    end
  end

  describe "#is_array?" do
    it "success result" do
      expect(is_array?(from: from, to: to, exclude: exclude)).to be true
    end

    context 'raise TypeError' do
      it 'from is not an array' do
        expect { is_array?(from: 'from', to: to, exclude: exclude) }.to raise_error(TypeError, 'from or to or exclude must be an array')
      end

      it 'to is not an array' do
        expect { is_array?(from: from, to: 'to', exclude: exclude) }.to raise_error(TypeError, 'from or to or exclude must be an array')
      end

      it 'exclude is not an array' do
        expect { is_array?(from: from, to: to, exclude: 'exclude') }.to raise_error(TypeError, 'from or to or exclude must be an array')
      end
    end
  end

  describe "#solution_exist?" do
    it "success result" do
      expect(solution_exist?(from: from, to: to, exclude: exclude)).to be true
    end

    context 'raise ArgumentError' do
      it 'when from.size not equal to.size ~> solution not found' do
        expect { solution_exist?(from: from, to: [0,0,0,0], exclude: exclude) }.to raise_error(ArgumentError, 'solution not found')
      end

      it 'when exclude include to ~> solution not found' do
        expect { solution_exist?(from: from, to: to, exclude: [to]) }.to raise_error(ArgumentError, 'solution not found')
      end
    end
  end

  describe "#disc_count_valid?" do
    it "success result" do
      expect(disc_count_valid?(from: from, to: to)).to be true
    end

    context 'raise ArgumentError' do

      it "DISC_COUNT not exits" do
        Object.send(:remove_const, :DISC_COUNT) if Object.const_defined?("DISC_COUNT")
        expect { disc_count_valid?(to: to, from: from) }.to raise_error(ArgumentError, 'DISC_COUNT must be defined')
      end

      it "DISC_COUNT non number" do
        Object.send(:remove_const, :DISC_COUNT) if Object.const_defined?("DISC_COUNT")
        DISC_COUNT = nil
        expect { disc_count_valid?(to: to, from: from) }.to raise_error(ArgumentError, 'DISC_COUNT must be a integer')
      end

      it "DISC_COUNT non number" do
        Object.send(:remove_const, :DISC_COUNT) if Object.const_defined?("DISC_COUNT")
        DISC_COUNT = 4
        expect { disc_count_valid?(to: to, from: from) }.to raise_error(ArgumentError, 'DISC_COUNT must be equal from & to size')
      end
    end

  end



end