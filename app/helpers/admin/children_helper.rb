module Admin::ChildrenHelper
  def team_name(team)
    if team.present?
      link_to team.name, admin_team_path(team)
    end
  end
end
