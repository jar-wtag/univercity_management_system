require 'rails_helper'
RSpec.describe Student, type: :model do
  let(:student) { FactoryBot.create(:student) }

  it { should belong_to(:department) }
  it {should have_many(:student_profiles)}
  it { should have_many(:sections).through(:student_profiles).dependent(:destroy) }


  describe "scope #sorted" do
    it "returns sorted students" do
      expect(Student.sorted.to_a).to eq(Student.order(:id).to_a)
    end
  end
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:age)}
  it {should validate_presence_of(:roll)}
  it {should validate_length_of(:name).is_at_most(50)}
  it {should validate_numericality_of(:age).is_greater_than_or_equal_to(22).is_less_than(40)}
  it {should validate_numericality_of(:roll).is_less_than(50)}
  it { should validate_uniqueness_of(:roll) }

  describe "valid with roll is less than 50 and uniq" do
    it "Invalid with roll is greater than 50" do
      student = FactoryBot.build(:student, roll: 55)
      student.valid?
      expect(student.errors[:roll]).to include{"is too long [maximum is 50 characters]"}
    end
    it "Invalid with duplicate roll" do
      FactoryBot.create(:student, roll: 40)
      student = FactoryBot.build(:student, roll: 40)
      student.valid?
      expect(student.errors[:roll]).to include{"is too long [maximum is 50 characters]"}
    end
  end

  end