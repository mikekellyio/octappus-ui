class Admin::ChildSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :nickname, :birthday
end
