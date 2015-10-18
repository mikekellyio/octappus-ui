module Api
class AwardResource < JSONAPI::Resource
  attribute :name

  has_one :step
  has_many :children
end
end
