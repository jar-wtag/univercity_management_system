class StudentProfile < ActiveRecord::Base
  belongs_to :section
  belongs_to :student

  scope :sorted, lambda { order("student_profiles.id ASC")}

  validates_presence_of :section_id, :student_id
  validates_uniqueness_of :section_id, scope: :student_id
  validates_uniqueness_of :student_id


  #validates_presence_of :student_id, uniqueness: true

end
