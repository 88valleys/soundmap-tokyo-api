class Api::V1::LivehousesController < ApplicationController
  def index
    if params[:title].present?
      @livehouses = Livehouse.where("title ILIKE ?", "%#{params[:title]}%")
    else
      @livehouses = Livehouse.all
    end
    # Putting the most recently created livehouses first
    render json: @livehouses.order(created_at: :desc)
  end

  def create
    @livehouse = Livehouse.new(livehouse_params)
    if @livehouse.save
      render json: @livehouse, status: :created
    else
      render json: { error: @livehouse.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @livehouse = Livehouse.find(params[:id])
    @livehouse.destroy
    head :no_content
  end

  private

  def livehouse_params
    params.require(:livehouse).permit(:title, :address, :picture, :capacity, :website_url, :nearest_station, :event_calendar_url, hours: {}, genres: [])
  end
end
