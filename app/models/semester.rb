class Semester < ActiveRecord::Base
  has_many :sections

  scope :sorted, lambda {order("semesters.id ASC")}

  validates :name, :presence => true,
            :length => {:maximum => 50}

end
