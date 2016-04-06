class Course < ActiveRecord::Base
  has_many :users, through: :enrollments, dependent: :destroy
  has_many :enrollments
  belongs_to :subject

  before_destroy :ensure_not_referenced_by_any_enrollment




  private
    # ensure that there are no enrollment referencing this course
    def ensure_not_referenced_by_any_enrollment
      if enrollment.empty?
        return true
      else
        errors.add(:base, 'Enrollments present')
        return false
      end
    end


  def self.search(search)
    where("name LIKE ?",  "%#{search}%")
  end

end
