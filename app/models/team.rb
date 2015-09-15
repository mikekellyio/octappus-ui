class Team < ActiveRecord::Base
  validates_presence_of :name
  has_many :children, -> { order(:first_name) }
end
