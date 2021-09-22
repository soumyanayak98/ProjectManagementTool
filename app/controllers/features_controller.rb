class FeaturesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @feature = @project.features.build(feature_params)
    if @feature.save
      respond_to do |format|
        flash.now[:success]="feature created successfully"
        format.js {render partial: 'features/result'}
      end
    end
  end

  def feature_params
    params.require(:feature).permit(:title, :description, :category_id)
  end
end