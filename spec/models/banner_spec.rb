require 'rails_helper'

RSpec.describe Banner, type: :model do
  it 'validates factory' do
    expect(create(:banner)).to be_valid
  end
end
