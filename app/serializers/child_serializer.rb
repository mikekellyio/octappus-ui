class ChildSerializer < ActiveModel::Serializer
  attributes :id, :id, :first_name, :last_name, :birthday, :nickname

  belongs_to :team
end
