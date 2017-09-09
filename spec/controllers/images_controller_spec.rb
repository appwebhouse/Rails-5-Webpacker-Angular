require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:valid_session) { sign_in create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {
        image: {
          file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
            '/spec/fixtures/files/rails.jpg')), 'image/jpeg')
        }
      }, xhr:true, session: valid_session
      expect(response).to have_http_status(:success)
    end

    it "create new image" do
      expect{
        post :create, params: {
          image: {
            file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
              '/spec/fixtures/files/rails.jpg')), 'image/jpeg')
          }
        }, xhr:true, session: valid_session
      }.to change(Image, :count).by(1)
    end
  end

end
