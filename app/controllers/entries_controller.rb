class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = @place.entries.new
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.new(entry_params)
    if @entry.save
      # Redirect to the place's show page after creating an entry
      redirect_to place_path(@place), notice: "Entry added successfully."
    else
      # Re-render the new entry form if there are errors
      render :new
    end
  end

  private

  def entry_params
    # Permit title, description, and posted_on; the place_id is handled by the nested route
    params.require(:entry).permit(:title, :description, :posted_on)
  end
end