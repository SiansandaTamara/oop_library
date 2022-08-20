require './classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('grade12B')
  end

  it 'should print the grade' do
    expect(@classroom.label).to eq 'grade12B'
  end
end
