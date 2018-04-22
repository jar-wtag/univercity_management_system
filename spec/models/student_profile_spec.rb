require 'rails_helper'
RSpec.describe StudentProfile, type: :model do
  let(:student_profile) { FactoryBot.create(:student_profile) }

  it { should belong_to(:section) }
  it { should belong_to(:student) }

  describe "scope #sorted" do
    it "returns sorted student_profiles" do
      expect(StudentProfile.sorted.to_a).to eq(StudentProfile.order(:id).to_a)
    end
  end
  it {should validate_presence_of(:student_id)}
  it {should validate_presence_of(:section_id)}
  it {should validate_uniqueness_of(:section_id).scoped_to(:student_id) }
end