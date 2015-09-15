class Admin::StepsController < ApplicationController
  before_action :set_admin_step, only: [:show, :edit, :update, :destroy]
  include TheSortableTreeController::Rebuild

  # GET /admin/steps
  def index
    @steps = Step.nested_set.select('id, title, content, parent_id').all
  end

  # GET /admin/steps/1
  def show
  end

  # GET /admin/steps/new
  def new
    @step = Step.new
  end

  # GET /admin/steps/1/edit
  def edit
  end

  # POST /admin/steps
  def create
    @step = Step.new(admin_step_params)

    if @step.save
      redirect_to admin_steps_url, notice: 'Step was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/steps/1
  def update
    if @step.update(admin_step_params)
      redirect_to admin_step_url(@step), notice: 'Step was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/steps/1
  def destroy
    @step.destroy
    redirect_to admin_steps_url, notice: 'Step was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_step
      @step = Step.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_step_params
      params.require(:step).permit(:title, :content, :parent_id)
    end
end
