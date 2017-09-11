require 'rails_helper'

RSpec.describe Api::Users::ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_session) { api_sign_in user }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { user_id: user.id }, xhr:true
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {
        user_id: user.id,
        image: {
          file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
            '/spec/fixtures/files/rails.jpg')), 'image/jpeg')
        }
      }, xhr: true
      expect(response).to have_http_status(:success)
    end

    it "create new image" do
      expect{
        post :create, params: {
          user_id: user.id,
          image: {
            file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
              '/spec/fixtures/files/rails.jpg')), 'image/jpeg')
          }
        }, xhr: true
      }.to change(Image, :count).by(1)
    end
  end

end
