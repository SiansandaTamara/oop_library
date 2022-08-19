require 'spec_helper'

describe Decorator do
  before :each do
    @decorator = Decorator.new('stanley')
  end

  describe '#new' do
    it 'returns new decorator object' do
      @decorator.should be_an_instance_of Decorator
    end
    it 'throws error when arguments less than 1' do
      -> { Decorator.new }.should raise_exception ArgumentError
    end
    it 'throws error when arguments more than 1' do
      -> { Decorator.new('name', 'extra_argument') }.should raise_exception ArgumentError
    end
  end

  describe 'testing argument values' do
    it 'returns correct nameable' do
      @decorator.nameable.should eql 'stanley'
    end
  end
end
