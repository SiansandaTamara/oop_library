require './teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(102, 44, 'math', 'TEST')
  end

  it 'instance of teacher' do
    expect(@teacher.name).to eq 'TEST'
  end

  it 'id correct' do
    expect(@teacher.parent_permission).to eq true
  end
end
