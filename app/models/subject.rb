class Subject < ActiveRecord::Base
  has_many :courses

  def self.search(search)
    where("name LIKE ?",  "%#{search}%")
  end

end
