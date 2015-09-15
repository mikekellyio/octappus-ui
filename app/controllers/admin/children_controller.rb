class Admin::ChildrenController < ApplicationController
  before_action :set_admin_child, only: [:show, :edit, :update, :destroy]

  # GET /admin/children
  def index
    @admin_children = Child.order("team_id ASC, first_name ASC").all
  end

  # GET /admin/children/1
  def show
  end

  # GET /admin/children/new
  def new
    @admin_child = Child.new
  end

  # GET /admin/children/1/edit
  def edit
  end

  # POST /admin/children
  def create
    @admin_child = Child.new(admin_child_params)

    if @admin_child.save
      redirect_to admin_child_path(@admin_child), notice: 'Child was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/children/1
  def update
    if @admin_child.update(admin_child_params)
      redirect_to admin_child_path(@admin_child), notice: 'Child was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/children/1
  def destroy
    @admin_child.destroy
    redirect_to admin_children_url, notice: 'Child was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_child
      @admin_child = Child.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_child_params
      params.require(:child).permit(:first_name, :last_name, :nickname, :birthday, :team_id)
    end
end
