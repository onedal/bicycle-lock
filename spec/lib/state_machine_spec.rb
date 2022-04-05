require 'spec_helper'

RSpec.describe BicycleLock::StateMachine do
  let(:from) { [0, 0, 0] }
  let(:to) { [1, 0, 1] }
  let(:exclude) { [[1, 2, 3], [4, 5, 6]] }

  describe '#initialize' do
    it 'success result' do
      expect(BicycleLock::StateMachine.new(current: from)).to be_a(BicycleLock::StateMachine)
    end

    it 'raise ArgumentError' do
      expect do
        BicycleLock::StateMachine.new(current: 123)
      end.to raise_error(ArgumentError, 'current must be an Array')
    end
  end

  describe '#increment_index!' do
    it 'success result' do
      machine = BicycleLock::StateMachine.new(current: from)
      machine.increment_index!(2)
      expect(machine.current).to eq([0, 0, 1])
    end
  end

  describe '#decrement_index!' do
    it 'success result' do
      machine = BicycleLock::StateMachine.new(current: [0, 1, 0])
      machine.decrement_index!(1)
      expect(machine.current).to eq([0, 0, 0])
    end
  end
end
