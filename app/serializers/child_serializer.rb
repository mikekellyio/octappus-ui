class ChildSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :avatar_hash, :birthday, :nickname, :created_at, :updated_at
  attributes :completed_step_ids, :pending_step_ids, :next_step_id, :team_id
  
end
