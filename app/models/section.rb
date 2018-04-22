class Section < ActiveRecord::Base
  belongs_to :semester
  belongs_to :teacher
  belongs_to :course
  has_many :student_profiles
  has_many :students, through: :student_profiles, dependent: :destroy

  scope :sorted, lambda {order("sections.section_no ASC")}

  validates_presence_of :section_no
  validates_uniqueness_of :section_no, scope: [:course_id]
end
