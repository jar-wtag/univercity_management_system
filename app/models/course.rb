class Course < ActiveRecord::Base
  belongs_to :department
  has_many :sections, dependent: :destroy


  scope :sorted, lambda {order("courses.id ASC")}

  # validates :course, presence: true
  #
  validates :name, presence: true, length: {maximum: 50 }, uniqueness: :true
  validates :course_code, :numericality => { greater_than_or_equal_to: 100, less_than_or_equal_to: 400 }, uniqueness: true
end





















