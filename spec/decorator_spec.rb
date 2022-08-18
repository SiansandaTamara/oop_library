require './captalize'
require './trimmer'
require './person'

describe Decorator do
  before :each do
    @person = Person.new 40, 'maximulus', 'maximulus'
    @captalize = CapitalizeDecorator.new(@person)
    @trimmer = TrimmerDecorator.new(@captalize)
  end
  it 'Should display name' do
    expect(@person.correct_name).to eq 'maximulus'
  end
  it 'should capitalize personne name' do
    expect(@captalize.correct_name).to eq 'Maximulus'
  end
  it 'should slice if sting is more than 10 char' do
    expect(@trimmer.correct_name).to eq 'Maximulus'
    expect(@trimmer.correct_name.length).to be <= 10
  end
end
