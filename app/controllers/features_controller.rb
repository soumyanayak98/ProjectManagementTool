class FeaturesController < ApplicationController

  def create
    byebug
    @project = Project.find(params[:project_id])
    @feature = @project.features.build(feature_params)
    if @feature.save
      flash[:success]="feature created successfully"
      redirect_to project_path(@project)
    end
  end

  def feature_params
    params.require(:feature).permit(:title, :description, :category_id)
  end
end