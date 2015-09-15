class Step < ActiveRecord::Base
  validates_presence_of :title
  
  has_many :awards

  acts_as_nested_set :counter_cache => :children_count
  include TheSortableTree::Scopes

end
