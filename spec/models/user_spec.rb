require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without email' do
    user = User.new(email: nil, password: '111111', role: '0')
    expect(user).to_not be_valid
  end
end
