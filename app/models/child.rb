class Child < ActiveRecord::Base
#  belongs_to :club
  belongs_to :team

  validates_presence_of :first_name, :last_name

  has_many :associated_steps, inverse_of: :child
  has_many :completed_steps, through: :associated_steps, class_name: "Step", source: :step

  def name
    "#{first_name} #{last_name}"
  end
  
  def team_name
    team.name if team.present?
  end

end
