require 'rails_helper'

RSpec.describe Api::Users::SessionsController, type: :controller do
  describe 'POST #create' do
    context 'found user' do
      let(:user) { create(:user) }

      before do
        post :create, xhr: true, params: {
          user: { email: user.email, password: user.password }
        }
      end

      it { expect(response).to be_ok }
      it { expect(response.body).to eq(user.reload.to_json) }
    end

    context 'user not found or bad params' do
      let(:user) { build(:user) }

      before do
        post :create, xhr: true, params: {
          user: { email: user.email, password: user.password }
        }
      end

      it { expect(response).to be_unauthorized }
      it {
        expect(response.body).to eq(I18n.t('devise.sessions.invalid').to_json)
      }
    end
  end
end
