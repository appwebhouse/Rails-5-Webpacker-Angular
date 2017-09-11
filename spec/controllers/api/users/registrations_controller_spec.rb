require 'rails_helper'

RSpec.describe Api::Users::RegistrationsController, type: :controller do
  describe 'POST #create' do
    context 'valid params' do
      let(:user) { build(:user) }
      subject {
        post :create, xhr: true, params: {
          user: { email: user.email, password: user.password }
        }
      }

      it {
        subject
        expect(response).to be_ok
      }
      it {
        subject
        expect(response.body).to include(user.email)
      }
      it { expect{ subject }.to change(User, :count).by(1) }
    end

    context 'bad params' do
      let(:user) { build(:user, password: '') }

      before do
        post :create, xhr: true, params: { user: { email: user.email } }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it do
        user.valid?
        expect(response.body).to eq(user.errors.full_messages.to_json)
      end
    end
  end
end
