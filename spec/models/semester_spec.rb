require 'rails_helper'
RSpec.describe Semester, type: :model do
  let(:semester) { FactoryBot.create(:semester) }

  it {should have_many(:sections)}

  describe "scope #sorted" do
    it "returns sorted semesters" do
      expect(Semester.sorted.to_a).to eq(Semester.order(:id).to_a)
    end
  end
end