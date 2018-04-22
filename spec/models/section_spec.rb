require 'rails_helper'
RSpec.describe Section, type: :model do
  let(:section) { FactoryBot.create(:section) }

  it { should belong_to(:semester) }
  it { should belong_to(:teacher) }
  it { should belong_to(:course) }
  it {should have_many(:student_profiles)}
  it { should have_many(:students).through(:student_profiles)}

  describe "scope #sorted" do
    it "returns sorted sections" do
      expect(Section.sorted.to_a).to eq(Section.order(:section_no).to_a)
    end
  end

  it {should validate_presence_of(:section_no)}
  it { should validate_uniqueness_of(:section_no).scoped_to(:course_id) }

end