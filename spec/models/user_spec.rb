require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    subject { create(:user, email: 'test@gmail.com', name: 'abc') }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
  end
end
