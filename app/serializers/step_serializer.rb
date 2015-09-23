class StepSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :depth, :rgt, :lft, :parent_id
  attributes :created_at, :updated_at

  attributes :child_ids
  attributes :completed_by_ids
end
