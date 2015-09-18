class Api::TeamsController < ApplicationController
  before_filter :default_format_json
  respond_to :json

  def index
    @teams = params[:ids].present? ? Team.where(id: params[:ids].split(',')) : Team.all
    respond_with @teams
  end

  def show
    @team = Team.find(params[:id])
    respond_with @team
  end

  def create
    @team = Team.new team_params
    @team.save
    respond_with @team
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    respond_with @team
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    respond_with @team
  end

private
  def team_params
    params.fetch(:team).permit(:id, :name)
  end

  def default_format_json
    if(request.headers["HTTP_ACCEPT"].nil? &&
       params[:format].nil?)
      request.format = :json
    end
  end
end
