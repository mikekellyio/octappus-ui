class TeamSerializer < ActiveModel::Serializer
  attributes :id, :id, :name, :created_at, :updated_at

  has_many :children
end
