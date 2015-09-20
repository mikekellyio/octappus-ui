class Child < ActiveRecord::Base
#  belongs_to :club
  belongs_to :team

  validates_presence_of :first_name, :last_name

  has_many :associated_steps, inverse_of: :child
  has_many :completed_steps,
           -> { order(:rgt) },
           through: :associated_steps,
           class_name: "Step",
           source: :step

  has_many :award_children
  has_many :awards, through: :award_children
  has_many :completed_awards, class_name: "Award", through: :completed_steps, source: :awards

  def pending_awards
    completed_awards.where.not(id: award_ids)
  end

  def pending_steps
    pending = Step.order(:rgt)\
                  .where.not(id: completed_step_ids)
    if completed_steps.present?
      pending = pending.where("steps.rgt > ?", completed_steps.last.rgt)
    end
    pending
  end

  def next_step
    [pending_steps.first]
  end

  def name
    "#{first_name} #{last_name}"
  end

  def team_name
    team.name if team.present?
  end

end
