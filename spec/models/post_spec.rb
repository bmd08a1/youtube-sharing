require 'rails_helper'

RSpec.describe Post do
  describe 'validations' do
    subject { create(:post) }

    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :link }
    it { is_expected.to validate_uniqueness_of(:link).scoped_to(:user_id) }
    it { is_expected.to validate_presence_of :title }
  end

  describe 'association' do
    it { is_expected.to belong_to(:user) }
  end
end