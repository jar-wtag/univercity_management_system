require 'rails_helper'
RSpec.describe Teacher, type: :model do
  let(:teacher) { FactoryBot.create(:teacher) }

  it { should belong_to(:department) }
  it { should have_many(:sections) }

  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_most(50)}
  it {should validate_presence_of(:designation)}
  it {should validate_length_of(:designation).is_at_most(70)}
  it {should validate_numericality_of(:age).is_greater_than_or_equal_to(30).is_less_than(40)}
end