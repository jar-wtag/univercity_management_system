class Teacher < ActiveRecord::Base
  belongs_to :department
  has_many :sections

  # validates :teacher, presense: true
  validates :name, presence: true, length: {maximum: 50 }
  validates :designation, presence: true, length: {maximum: 70 }
  validates :age, :numericality => { greater_than_or_equal_to: 30, less_than: 40 }
end
