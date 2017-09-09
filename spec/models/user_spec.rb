require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:images).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'factory' do
    context 'is valid' do
      let(:user) { build(:user) }
      it { expect(user).to be_valid }
    end

    context 'is invalid' do
      let(:user) { build(:user, email: 'asd') }
      it { expect(user).to be_invalid }
    end
  end
end
