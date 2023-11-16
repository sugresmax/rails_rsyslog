require 'rails_helper'

RSpec.describe SystemEvent, type: :model do
  it 'has a valid factory' do
    expect(build(:system_event)).to be_valid
  end
end
