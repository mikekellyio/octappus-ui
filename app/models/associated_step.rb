class AssociatedStep < ActiveRecord::Base
  belongs_to :child
  belongs_to :step, inverse_of: :associated_children
end
