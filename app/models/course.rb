class Course < ActiveRecord::Base
  has_many :users, through: :enrollments, dependent: :destroy

  def self.search(search)
    where("name LIKE ?",  "%#{search}%")
  end

end
