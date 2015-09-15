class Child < ActiveRecord::Base
#  belongs_to :club
  belongs_to :team

  validates_presence_of :first_name, :last_name

  has_many :associated_steps, inverse_of: :child
  has_many :awarded_associated_steps, -> { where.not(award_received_at: nil)}, class_name: "AssociatedStep", inverse_of: :child
  has_many :pending_award_associated_steps, -> { where(award_received_at: nil)}, class_name: "AssociatedStep", inverse_of: :child
  has_many :completed_steps, through: :associated_steps, class_name: "Step", source: :step
  has_many :awarded_steps, through: :awarded_associated_steps, class_name: "Step", source: :step
  has_many :pending_award_steps, through: :pending_award_associated_steps, class_name: "Step", source: :step
  
  has_many :awards, through: :awarded_steps, source: :awards
  has_many :pending_awards, class_name: "Award", through: :pending_award_steps, source: :awards

  def name
    "#{first_name} #{last_name}"
  end
  
  def team_name
    team.name if team.present?
  end

end
