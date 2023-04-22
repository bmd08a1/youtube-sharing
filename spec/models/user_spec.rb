require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    subject { create(:user, email: 'test@gmail.com', name: 'abc') }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('test@gmail.com').for(:email) }
    it { is_expected.to_not allow_value('test@@gmail.com').for(:email) }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end
end
