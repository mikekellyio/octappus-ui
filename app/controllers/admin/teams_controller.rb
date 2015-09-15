class Admin::TeamsController < ApplicationController
  before_action :set_admin_team, only: [:show, :edit, :update, :destroy]

  # GET /admin/teams
  def index
    @admin_teams = Team.all
  end

  # GET /admin/teams/1
  def show
  end

  # GET /admin/teams/new
  def new
    @admin_team = Team.new
  end

  # GET /admin/teams/1/edit
  def edit
  end

  # POST /admin/teams
  def create
    @admin_team = Team.new(admin_team_params)

    if @admin_team.save
      redirect_to admin_team_url(@admin_team), notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/teams/1
  def update
    if @admin_team.update(admin_team_params)
      redirect_to admin_team_url(@admin_team), notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/teams/1
  def destroy
    @admin_team.destroy
    redirect_to admin_teams_url, notice: 'Team was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_team
      @admin_team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_team_params
      params.require(:team).permit(:name)
    end
end
