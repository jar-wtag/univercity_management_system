class Student < ActiveRecord::Base
  belongs_to :department
  has_many :student_profiles
  has_many :sections, through: :student_profiles, dependent: :destroy
  #accepts_nested_attributes_for :student_profiles

  scope :sorted, lambda { order("students.id ASC")}

  validates_presence_of :name, :age, :roll
  validates :name, length: {maximum: 50 }
  validates :age, :numericality => { greater_than_or_equal_to: 22, less_than: 40 }
  validates :roll, :numericality => { less_than: 50 }, uniqueness: { scope: :department_id }


  # def information
  #   "#{name} #{age} #{roll}"
  # end

end
