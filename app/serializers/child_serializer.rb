class ChildSerializer < ActiveModel::Serializer
  attribute :id
  attribute :first_name, key: "first-name"
  attribute :last_name, key: "last-name"
  attribute :avatar_hash, key: "avatar-hash"
  attributes :birthday, :nickname, :created_at, :updated_at

  belongs_to :team
  has_many :completed_steps, key: "completed-steps"
  has_many :pending_steps, key: "pending-steps"
  has_one :next_step, key: "next-step"
end
