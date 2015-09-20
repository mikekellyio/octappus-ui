class Api::TeamsController < ApiController
  respond_to :json

  def index
    @teams = params[:ids].present? ? Team.where(id: params[:ids].split(',')) : Team.all
    respond_with @teams, include: 'children'
  end

  def show
    @team = Team.find(params[:id])
    respond_with @team, include: 'children'
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    respond_with :api, @team
  end

private
  def team_params
    params.fetch(:team).permit(:id, :name)
  end
end
