class Category < ActiveRecord::Base
  attr_accessible :name, :priority

  validates :name, presence: true
  validates :priority, uniqueness: true, allow_blank: true
end

