class StepSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :depth, :rgt, :lft
  attributes :created_at, :updated_at

  belongs_to :parent
  has_many :children
  has_many :siblings
  has_many :completed_by, key: "completed-by"
end
