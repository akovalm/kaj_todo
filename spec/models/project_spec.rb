require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'is valid with a name' do
    project = Project.new(name: 'Name')
    expect(project).to be_valid
  end

  it 'is not valid without a name' do
    project = Project.new(name: nil)
    expect(project).to_not be_valid
  end

  it 'is not valid without a user' do
    project = Project.new(name: 'project', user_id: nil)
    expect(project).to_not be_valid
  end

  it { should have_many(:tasks) }
end
