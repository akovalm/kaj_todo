require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should belong to project' do
    should belong_to(:project)
  end

  it { is_expected.to validate_presence_of(:name) }
end
