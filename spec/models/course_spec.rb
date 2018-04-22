require 'rails_helper'
RSpec.describe Course, type: :model do
  let(:course) { FactoryBot.create(:course) }

  it { should belong_to(:department) }
  it { should have_many(:sections) }

  describe "scope #sorted" do
    it "returns sorted courses" do
      expect(Course.sorted.to_a).to eq(Course.order(:id).to_a)
    end
  end

  it {should validate_length_of(:name).is_at_most(50)}
  it {should validate_numericality_of(:course_code).is_greater_than_or_equal_to(100).is_less_than_or_equal_to(400)}


end
