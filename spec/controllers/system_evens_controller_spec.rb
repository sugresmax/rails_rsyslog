require 'rails_helper'

RSpec.describe SystemEventsController, type: :controller do
  describe 'unauthorized user' do
    describe 'GET #index' do
      it do
        get :index
        is_expected.to redirect_to login_path
      end
    end
  end

  describe 'authorized user' do
    describe 'GET #index' do
      it do
        get :index, session: { user_id: create(:user).id }
        expect(response).to have_http_status :ok
      end
    end
  end
end
