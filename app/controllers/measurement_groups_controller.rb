class MeasurementGroupsController < ApplicationController
  def index
    @measurement_group = MeasurementGroup.all
  end

  def new
    @measurement_group = MeasurementGroup.new
  end

  def edit
  @measurement_group = MeasurementGroup.find(params[:id])
  end

  def show
    @measurement_group = MeasurementGroup.find(params[:id])
  end

  def create
    @measurement_group = MeasurementGroup.new(measurementGroup_params)

    if @measurement_group.save
    redirect_to @measurement_group
    else
    render 'new'
    end
  end

  def update
  @measurement_group = MeasurementGroup.find(params[:id])

  if @measurement_group.update(measurementGroup_params)
    redirect_to @measurement_group
  else
    render 'edit'
  end
  end

  def destroy
  @measurement_group = MeasurementGroup.find(params[:id])
  @measurement_group.destroy

  redirect_to measurement_groups_path
end



  private
  def measurementGroup_params
    params.require(:measurement_group).permit(:sampleID, :researcherID, :deviceID, :name, :date)
  end
end