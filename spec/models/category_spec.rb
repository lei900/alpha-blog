require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    xit { should belong_to(:category).class_name('MenuCategory') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_most(25) }
    it { should validate_length_of(:name).is_at_least(3) }
  end
end
