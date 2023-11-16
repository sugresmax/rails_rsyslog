require 'rails_helper'

RSpec.describe SessionsController do
  describe 'get #login' do
    describe 'authorized user' do
      it do
        get :new, session: { user_id: create(:user).id }
        expect(subject).to redirect_to root_path
      end
    end

    describe 'unauthorized user' do
      it do
        get :new
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'post #create' do
    let!(:user) { create(:user, password: 'qwerty123') }

    context 'when user name and password valid' do
      it do
        post :create, params: { session: { name: user.name, password: 'qwerty123' } }
        expect(subject).to redirect_to root_path
      end

      it 'creates session' do
        post :create, params: { session: { name: user.name, password: 'qwerty123' } }
        expect(@request.session['user_id']).to eq(user.id)
      end
    end

    context 'when user name or password invalid' do
      it do
        post :create, params: { session: { name: user.name, password: 'qwerty' } }
        expect(subject).to redirect_to login_path
      end

      it 'not creates session' do
        post :create, params: { session: { name: user.name, password: 'qwerty' } }
        expect(@request.session['user_id']).to_not eq(user.id)
      end
    end
  end

  describe 'get #logout' do
    it 'redirects to login path' do
      get :logout
      expect(subject).to redirect_to login_path
    end

    it 'not nullify session' do
      get :logout
      expect(@request.session['user_id']).to eq(nil)
    end
  end
end
