class Api::StepsController < ApiController
  respond_to :json

  def index
    @steps = params[:ids].present? ? Step.where(id: params[:ids].split(',')) : Step.nested_set
    respond_with @steps
  end

  def show
    @step = Step.find(params[:id])
    respond_with @step
  end

  def create
    @step = Step.new step_params
    @step.save
    respond_with :api, @step
  end

  def update
    @step = Step.find(params[:id])
    @step.update_attributes(step_params)
    respond_with :api, @step
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    respond_with :api, @step
  end

private
  def step_params
    params.fetch(:step).permit(:id, :title)
  end
end
