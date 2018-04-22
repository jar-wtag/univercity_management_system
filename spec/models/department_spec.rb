require 'rails_helper'
RSpec.describe Department, type: :model do
  let(:department) { FactoryBot.create(:department) }
  # let(:invalid_department) { FactoryBot.build(:department, name: nil) }

  it {should have_many(:students)}
  it {should have_many(:teachers)}
  it {should have_many(:courses)}


  describe "scope #sorted" do
    it "returns sorted departments" do
      expect(Department.sorted.to_a).to eq(Department.order(:id).to_a)
    end
  end

  describe "valid with the name, length with maximum 50 and uniqueness" do
    it "is valid with name" do
      expect(department).to be_valid
    end

    # it "is invalid without name" do
    #   invalid_department.valid?
    #   expect(invalid_department.errors[:name]).to include("can't be blank")
    # end

    # it "valid with maximum length is 50" do
    #   department = Department.create(name: 'Finance')
    #   expect(department).to be_valid
    # end

    it "is invalid with the length is more than 50" do
      # department = Department.new(name: 'FinanceFinanceFinanceFinanceFinanceFinanceFinanceFinanceFinanceFinanceFinance')
      department = FactoryBot.build(:department, name: 'FinanceFinanceFinanceFinanceFinanceFinanceFinanceFinanceFinanceFinanceFinance')
      department.valid?
      expect(department.errors[:name]).to include{"is too long [maximum is 50 characters]"}
    end

    it "is invalid with a duplicate name" do
      FactoryBot.create(:department, name: 'Marketing')
      department = FactoryBot.build(:department, name: 'Marketing')
      # Department.create(name: 'Marketing')
      # department = Department.new(name: 'Marketing')
      department.valid?
      expect(department.errors[:name]).to include("has already been taken")
    end

  end

  # it {should validate_presence_of(:name)}
  # it {should validate_length_of(:name).is_at_most(50)}
  # it {should validate_uniqueness_of(:name) }

end
