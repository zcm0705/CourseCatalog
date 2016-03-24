class Subject < ActiveRecord::Base
  has_many :courses

  def get_subject_name
    "#{name}"
  end

end
