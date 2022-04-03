require 'spec_helper'

RSpec.describe BicycleLock::StateMachine do
  let(:from) { [0, 0, 0] }
  let(:to) { [1, 0, 1] }
  let(:exclude) { [[1, 2, 3], [4, 5, 6]] }

  describe '#initialize' do
    it 'success result' do
      expect(BicycleLock::StateMachine.new(current: 123)).to be_a(BicycleLock::StateMachine)
    end

    it 'raise ArgumentError' do
      expect do
        BicycleLock::StateMachine.new(current: from)
      end.to raise_error(ArgumentError, 'current must be an integer')
    end
  end

  describe '#increment!' do
    it 'success result' do
      machine = BicycleLock::StateMachine.new(current: 0)
      machine.increment!
      expect(machine.current).to eq(1)
    end
  end

  describe '#decrement!' do
    it 'success result' do
      machine = BicycleLock::StateMachine.new(current: 1)
      machine.decrement!
      expect(machine.current).to eq(0)
    end
  end

  describe '#output' do
    it 'success result' do
      machine = BicycleLock::StateMachine.new(current: 123)
      expect(machine.output).to eq([1, 2, 3])
    end
  end
end
