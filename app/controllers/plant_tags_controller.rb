class PlantTagsController < ApplicationController
  before_action :set_plant, only: %i[new create]

  def new
    @plant_tag = PlantTag.new
  end

  def create
    Tag.find(params[:plant_tag][:tag_id]).each do |tag|
      PlantTag.create(plant: @plant, tag: tag)
    end
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end
end
