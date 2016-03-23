class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

  has_many :courses, through: :enrollments, dependent: :destroy
end
