class Api::TeamsController < ApplicationController
  respond_to :json

  def index
    @teams = params[:ids].present? ? Team.where(id: params[:ids].split(',')) : Team.all
    respond_with @teams
  end
end
