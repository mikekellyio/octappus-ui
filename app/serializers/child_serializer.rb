class ChildSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :birthday, :nickname, :created_at, :updated_at

  def firstname
    object.first_name
  end

  def lastname
    object.last_name
  end

  belongs_to :team
end
