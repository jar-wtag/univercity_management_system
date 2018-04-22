class Department < ActiveRecord::Base
  has_many :students, dependent: :destroy
  has_many :teachers, dependent: :destroy
  has_many :courses, dependent: :destroy

  scope :sorted, lambda { order("departments.id ASC")}

  validates :name, :presence => true,
            :length => {:maximum => 50}, uniqueness: true


end
