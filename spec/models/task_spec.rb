require 'rails_helper'

describe Task, type: :model do
  let(:tag) { create :tag }
  let(:task) { create :task }

  it { should validate_presence_of(:name) }

  it 'factory should produce valid task' do
    task = build :task
    expect(task).to be_valid
  end

end
