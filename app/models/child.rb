class Child < ActiveRecord::Base
#  belongs_to :club
  belongs_to :team

  validates_presence_of :first_name, :last_name

  has_many :associated_steps, inverse_of: :child
  has_many :completed_steps, through: :associated_steps, class_name: "Step", source: :step

  has_and_belongs_to_many :awards
  has_many :completed_awards, class_name: "Award", through: :completed_steps, source: :awards

  def pending_awards
    completed_awards.where.not(id: award_ids)
  end

  def next_step
    if completed_steps.present?
      completed_steps.last.next_step
    else
      Step.roots.first
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def team_name
    team.name if team.present?
  end

end
