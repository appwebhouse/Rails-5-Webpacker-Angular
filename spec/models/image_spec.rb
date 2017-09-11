require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'factory' do
    context 'is valid' do
      let(:image) { build(:image, user: create(:user)) }
      it { expect(image).to be_valid }
    end

    context 'is invalid' do
      let(:image) { build(:image) }
      it { expect(image).to be_invalid }
    end
  end
end
