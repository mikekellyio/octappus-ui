class Api::ChildrenController < ApplicationController
  respond_to :json

  def index
    @children = params[:ids].present? ? Child.where(id: params[:ids].split(',')) : Child.all
    respond_with @children
  end

  def show
    @child = Child.find(params[:id])
    respond_with @child
  end

  def create
    @child = Child.new child_params
    @child.save
    respond_with @child
  end

  def update
    @child = Child.find(params[:id])
    @child.update_attributes(child_params)
    respond_with @child
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    respond_with @child
  end

private
  def child_params
    params.fetch(:child).permit(:id, :name)
  end
end
