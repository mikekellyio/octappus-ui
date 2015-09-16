class AwardChild < ActiveRecord::Base
  self.table_name = "awards_children"

  belongs_to :award
  belongs_to :child
end
