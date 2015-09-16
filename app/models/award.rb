class Award < ActiveRecord::Base

  has_many :award_children
  has_many :children, through: :award_children
end
