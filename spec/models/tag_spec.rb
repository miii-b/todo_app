require 'rails_helper'

describe Tag, type: :model do
  subject { create :tag }

  it { should validate_presence_of(:name) }

  it 'factory should produce valid tag' do
    tag = build :tag
    expect(tag).to be_valid
  end
end
