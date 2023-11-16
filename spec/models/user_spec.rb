require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  describe 'Validations' do
    it { expect(user).to validate_presence_of(:name) }
    it { expect(user).to validate_uniqueness_of(:name) }
    it { expect(user).to allow_value('Abcdef_-.').for(:name) }
    it { expect(user).to validate_presence_of(:password_digest) }
    it { expect(user).to validate_confirmation_of(:password) }
    it { expect(user).to validate_presence_of(:password_confirmation) }
  end
end
