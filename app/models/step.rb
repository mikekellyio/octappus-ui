class Step < ActiveRecord::Base
  validates_presence_of :title

  has_many :awards
  has_many :associated_children, class_name: "AssociatedStep", inverse_of: :step
  has_many :completed_by, through: :associated_children, class_name: "Child"

  acts_as_nested_set counter_cache: :children_count
  include TheSortableTree::Scopes

  belongs_to :next_step, class_name: "Step", foreign_key: :rgt
  belongs_to :previous_step, class_name: "Step", foreign_key: :lft

end
