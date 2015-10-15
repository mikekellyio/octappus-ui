module Api
class ChildResource < JSONAPI::Resource
  attribute :first_name
  attribute :last_name
  attribute :avatar_hash
  attributes :birthday, :nickname, :created_at, :updated_at

  has_one :team
  has_many :completed_steps, class_name: 'Step', acts_as_set: true
  has_many :pending_steps, class_name: 'Step', acts_as_set: true
  has_one :next_step, class_name: 'Step'
end
end
