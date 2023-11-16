require 'rails_helper'

RSpec.describe UsersController do
  describe 'unauthorized user' do
    describe 'GET #show' do
      it do
        get :show
        expect(subject).to redirect_to login_path
      end
    end

    describe 'PATCH #update' do
      it do
        patch :update
        expect(subject).to redirect_to login_path
      end
    end
  end

  describe 'authorized user' do
    describe 'GET #show' do
      it do
        get :show, session: { user_id: create(:user).id }
        expect(response).to have_http_status :ok
      end
    end

    describe 'PATCH #update' do
      let(:password) { SecureRandom.base64(6) }
      let(:current_password) { SecureRandom.base64(6) }
      let!(:user) { create(:user, password: current_password, password_confirmation: current_password) }

      context 'when password challenge is passed and password is confirmed' do
        it do
          patch :update,
                params: { user: { password_challenge: current_password, password: password,
                                  password_confirmation: password } }, session: { user_id: user.id }
          expect(subject).to redirect_to root_path
        end
      end

      context 'when password challenge is not passed and password is confirmed' do
        it do
          patch :update,
                params: { user: { password_challenge: '', password: password,
                                  password_confirmation: password } }, session: { user_id: user.id }
          expect(response).to have_http_status :unprocessable_entity
        end
      end

      context 'when password and password_confirmation is missmatched' do
        it do
          patch :update,
                params: { user: { password_challenge: current_password, password: password,
                                  password_confirmation: "#{password}q" } }, session: { user_id: user.id }
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end
