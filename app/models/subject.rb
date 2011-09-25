class Subject < ActiveRecord::Base
  has_many :Books
  attr_accessible :subject_name

  validates_presence_of :subject_name
  validates_uniqueness_of :subject_name

end
