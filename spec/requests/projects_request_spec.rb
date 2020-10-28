require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new project and redirect to root path' do
        expect do
          post :create, project: %i[name user_id]
          response.should redirect_to(root_url)
        end
      end
    end
  end
end
